# frozen_string_literal: true

class Pacman
  attr_accessor :x, :y

  def initialize(x, y)
    @x_speed = 0
    @y_speed = 0
    @x = x
    @y = y
    @pacman = Circle.new(x: x, y: y, radius: 15, sectors: 32, color: 'yellow', z: 10)
  end

  def get_coordinates
    [x, y]
  end

  def move_x(x)
    @pacman.x += (x + @x_speed)
  end

  def move_y(y)
    @pacman.y += (y + @y_speed)
  end

  def check_colision
    @pacman.contains?(object.first.x, object.first.y)
  end

  private

  def get_object(x, y, array_objects); end

  def eat_fruit(fruit, array_objects)
    fruit.remove
    array_objects.delete(fruit)
  end
end
