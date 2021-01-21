# frozen_string_literal: true

# Class that describe the fruit object
class Fruit
  attr_reader :x, :y, :fruit

  def initialize(x_position, y_position)
    @x_position = x_position
    @y_position = y_position
    @fruit = Circle.new(x: @x_position, y: @y_position, radius: 4, color: 'orange', z: 1)
  end

  def get_coordinates
    [x, y]
  end
end
