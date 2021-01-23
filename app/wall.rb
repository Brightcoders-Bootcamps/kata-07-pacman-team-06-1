# frozen_string_literal: true

# class for square inside windows
class Wall
  attr_reader :wall2d, :x, :y, :width, :height

  def initialize(coord_x, coord_y)
    @wall2d = Square.new(x: @x, y: @y, size: 70, color: 'blue', z: 10)
    @x = coord_x
    @y = coord_y
    @width = @wall2d.width
    @height = @wall2d.height
  end
end
