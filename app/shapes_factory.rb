# frozen_string_literal: true

# Class that build the diferents shapes that exists
class ShapesFactory
  require_relative 'fruit'
  require_relative 'pacman'
  require_relative 'wall'
  require_relative 'phantom'

  class << self
    def create_shape(object_type, x_position, y_position)
      case object_type
      when 'fruit'
        create_fruit(x_position, y_position)
      when 'pacman'
        create_pacman(x_position, y_position)
      when 'wall'
        create_wall(x_position, y_position)
      else
        puts "imposible create #{object_type} shape"
      end
    end

    def create_pacman(x_position, y_position)
      Pacman.new(x_position, y_position)
    end

    def create_phantom; end

    def create_wall(x_position, y_position)
      Wall.new(x_position, y_position)
    end

    def create_fruit(x_position, y_position)
      Fruit.new(x_position, y_position)
    end
  end
end
