# frozen_string_literal: true

class Phantom
  def initialize
    create_phantom
  end

  def create_phantom
    Circle.new(x: 200, y: 100, radius: 10, color: 'pink', z: 10)
  end
end
