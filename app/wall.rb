# frozen_string_literal: true

# Class that describe the wall object
class Wall
  attr_reader :wall2d

  def initialize(x_position, y_position)
    @x1_position = x_position
    @y1_position = y_position

    @wall2d = Square.new(x: @x1_position, y: @y1_position, size: 70, color: 'blue', z: 10)
  end

  # eliminar
  def remove
    @wall2d.remove
  end

  # retornar un array con x, y
  def get_coordinates; end
end
