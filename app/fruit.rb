# frozen_string_literal: true

# Class that describe the fruit object
class Fruit
  attr_reader :x, :y, :fruit, :radius
  def initialize(x, y)
      @x = x
      @y = y
      @fruit = Circle.new( x: x , y: y, radius: 4, color: 'orange', z: 1 )
      @radius = @fruit.radius
  end

  def get_coordinates
      return [self.x, self.y]
  end

end