# frozen_string_literal: true

# Class that describe the fruit object
class Fruit
  attr_reader :x, :y, :fruit, :radius

  def initialize(coord_x, coord_y)
    @x = coord_x
    @y = coord_y
    @fruit = Circle.new(x: @x, y: @y, radius: 4, color: 'orange', z: 1)
    @radius = @fruit.radius
  end
end
