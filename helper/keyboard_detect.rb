# frozen_string_literal: true

require 'ruby2d'
class KeyboardListener
  attr_reader :x_speed, :y_speed

  def initialize(window)
    @window = window
    @x_speed = 0
    @y_speed = 0
    listener_key_press
  end

  def listener_key_press
    @window.on :key_down do |event|
      case event.key
      when 'a', 'left'
        @x_speed = -1
        @y_speed = 0
      when 'd', 'right'
        @x_speed = 1
        @y_speed = 0
      when 'w', 'up'
        @x_speed = 0
        @y_speed = -1
      when 's', 'down'
        @x_speed = 0
        @y_speed = 1
      end
    end
  end
end
