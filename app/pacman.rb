# frozen_string_literal: true

# This class is for pacman object
class Pacman
  attr_accessor :x, :y

  def initialize(coor_x, coor_y)
    @x_speed = 0
    @y_speed = 0
    @x = coor_x
    @y = coor_y
    @prev_x = 0
    @prev_y = 0
    @pacman = Circle.new(x: @x, y: @y, radius: 15, sectors: 32, color: 'yellow', z: 10)
  end

  # move pacman on x axis and check if it is collisioned with other objects
  # @prev_x is for save previuos coordinates of the pacman, is used on collision_by_wall
  def move_x(coord_x, array_objects, score_text)
    @prev_x = @pacman.x
    @pacman.x += (coord_x + @x_speed)
    check_colision(array_objects, score_text)
  end

  # move pacman on x axis and check if it is collisioned with other objects
  # @prev_y is for save previuos coordinates of the pacman, is used on collision_by_wall
  def move_y(coord_y, array_objects, score_text)
    @prev_y = @pacman.y
    @pacman.y += (coord_y + @y_speed)
    check_colision(array_objects, score_text)
  end

  # this private method is called when pacman are moving on the world
  def check_colision(array_objects, score_text)
    array_objects.each do |object|
      eat_or_stop(object, array_objects, score_text) if intersect_square?(object) || intersect_circle?(object)
    end
    stop_pacman if intersect_border?
  end

  # this method call eat_fruit and collision_by_wall, depending on the object
  def eat_or_stop(obj, array_objects, score_text)
    if obj.instance_of?(Wall)
      stop_pacman
    elsif obj.instance_of?(Fruit)
      eat_fruit(obj, array_objects, score_text)
    end
  end

  # this method remove fruit when pacman touch it
  def eat_fruit(fruit, array_objects, score_text)
    puts fruit.inspect
    fruit.fruit.remove
    array_objects.delete(fruit)
    score_text.add_score(1)
  end

  # this method stop pacman when it collisioned on walls
  def stop_pacman
    @pacman.x = @prev_x
    @pacman.y = @prev_y
  end

  # simple solutions for calculate when circle(pacman) collisioned on wall(square)
  def intersect_square?(square)
    return false if square.instance_of?(Fruit)

    square_size = calculate_square_size(square)
    distance = calculate_distance(square, square_size)
    check_sides = check_sides_collision(distance, square_size)

    return check_sides unless check_sides.nil?

    square_area(distance, square_size) <= (@pacman.radius * @pacman.radius)
  end

  # check if pacman touch some border of the square
  def check_sides_collision(distance, square_size)
    return false if distance[:dist_x] > (square_size[:sw] + @pacman.radius)
    return false if distance[:dist_y] > (square_size[:sh] + @pacman.radius)
    return true if distance[:dist_x] <= square_size[:sw] || distance[:dist_y] <= square_size[:sh]
  end

  # calculate square width and heigth
  def calculate_square_size(square)
    { sw: square.width / 2, sh: square.height / 2 }
  end

  # determine the distance over pacman and square
  def calculate_distance(square, square_size)
    { dist_x: (@pacman.x - (square.x + square_size[:sw])).abs,
      dist_y: (@pacman.y - (square.y + square_size[:sh])).abs }
  end

  # determine the square area
  def square_area(distance, square_size)
    x = (distance[:dist_x] - square_size[:sw])
    y = distance[:dist_y] - square_size[:sh]
    (x * x + y * y)
  end

  # simple solutions for calculate when circle(pacman) collisioned on fruit(circle)
  def intersect_circle?(circle)
    return false if circle.instance_of?(Wall)

    x = circle.x - @pacman.x
    y = @pacman.y - circle.y
    radius = circle.radius + @pacman.radius
    x * x + y * y <= radius * radius
  end

  def intersect_border?
    return true if @pacman.x < 20 || @pacman.x > 624
    return true if @pacman.y < 65 || @pacman.y > 450
  end
end
