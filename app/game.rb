require 'ruby2d'
require_relative './window'
require_relative '../helper/keyboard_detect'
require_relative 'shapes_factory'
class Game 
    def initialize
        @window = create_world
        @fruits = Array.new
        draw_fruits
        draw_pacman
        animate_game
        @window.window.show
        
    end

    def create_world
      WindowGame.new
    end

    def draw_fruits
        (50..480).each do |height|
            (0..640).each do |width|
            @fruits << ShapesFactory.create_shape('fruit', width, height) if (width % 25).zero? && (height % 25).zero?
            end
        end
    end

    def draw_pacman
        @pacman = ShapesFactory.create_shape('pacman', 300, 300)
    end

    def animate_game
        keyboard_listener = KeyboardListener.new(@window.window)
        @window.update_window do 
            @pacman.move_x(keyboard_listener.x_speed)
            @pacman.move_y(keyboard_listener.y_speed)
            #@pacman.check_colision
        end
    end
end

Game.new