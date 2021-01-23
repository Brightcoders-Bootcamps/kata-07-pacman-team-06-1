# frozen_string_literal: true

require 'ruby2d'
require_relative './window'
require_relative '../helper/keyboard_detect'
require_relative '../helper/text2d'
require_relative 'shapes_factory'

# Main class that manage the entire game
class Game
  def initialize
    @window = WindowGame.new
    @objects = []
    @pacman = ShapesFactory.create_shape('pacman', 300, 300)
    draw_fruits
    draw_wall
    add_score
    animate_game
    draw_limits
    @window.window.show
  end

  def draw_fruits
    (75..430).each do |height|
      (0..630).each do |width|
        @objects << ShapesFactory.create_shape('fruit', width, height) if (width % 25).zero? && (height % 25).zero?
      end
    end
  end

  # Create the walls on the window
  def draw_wall
    (65..515).each do |width|
      (140..340).each do |height|
        check_position_to_place_wall(width, height)
      end
    end
  end

  
  # Validates the position to create the wall in the right place
  def check_position_to_place_wall(width, height)
    if [65, 290, 515].include?(width) && [140, 340].include?(height)
      @objects << ShapesFactory.create_shape('wall', width, height)
    end
  end

  def animate_game
    keyboard_listener = KeyboardListener.new(@window.window)
    @window.update_window do
      @pacman.move_x(keyboard_listener.x_speed, @objects, @score_text)
      @pacman.move_y(keyboard_listener.y_speed, @objects, @score_text)
    end
  end

  def add_score
    @score_text = Text2d.new(530, 10, 0)
  end

  def draw_limits
    Line.new(x1: 0, y1: 50, x2: 0, y2: 470, width: 10, color: 'white', z: 20) # left limit
    Line.new(x1: 645, y1: 50, x2: 645, y2: 470, width: 10, color: 'white', z: 20) # rigth limit
    Line.new(x1: 0, y1: 50, x2: 645, y2: 50, width: 5, color: 'white', z: 20) # top limit
    Line.new(x1: 0, y1: 470, x2: 645, y2: 470, width: 10, color: 'white', z: 20) # bottom limit
  end
end

Game.new
