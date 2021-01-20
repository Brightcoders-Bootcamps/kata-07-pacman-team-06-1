require 'ruby2d'
require_relative './window'
require_relative '../helper/keyboard_detect'
require_relative 'shapes_factory'
class Game 
    def initialize
        @window = create_world
        @objects = Array.new
        draw_fruits
        draw_pacman
        draw_wall
        animate_game
        @window.window.show
        
    end

    def create_world
      WindowGame.new
    end

    def draw_fruits
        (50..480).each do |height|
            (0..640).each do |width|
            @objects << ShapesFactory.create_shape('fruit', width, height) if (width % 25).zero? && (height % 25).zero?
            end
        end
    end

    def draw_pacman
        @pacman = ShapesFactory.create_shape('pacman', 300, 300)
    end

    #refactorizar.
    def draw_wall
        @objects << ShapesFactory.create_shape("wall", 120, 60)
        @objects << ShapesFactory.create_shape("wall", 120, 200)
        @objects << ShapesFactory.create_shape("wall", 120, 350)

        @objects << ShapesFactory.create_shape("wall", 320, 60)
        @objects << ShapesFactory.create_shape("wall", 320, 200)
        @objects << ShapesFactory.create_shape("wall", 320, 350)
    end

    def animate_game
        keyboard_listener = KeyboardListener.new(@window.window)
        @window.update_window do 
            @pacman.move_x(keyboard_listener.x_speed)
            @pacman.move_y(keyboard_listener.y_speed)
            #@pacman.check_colision
        end
    end

    def add_score
        @score_text = Text.new("%03d" % score, x: 530, y: 10, color: 'white', size: 20, opacity: 1 )
    end
end

Game.new