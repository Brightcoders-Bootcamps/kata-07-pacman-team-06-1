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
      if event.key == 'a' || event.key == 'left' 
        @x_speed = -1
        @y_speed = 0
      elsif event.key == 'd' || event.key == 'right' 
        @x_speed = 1
        @y_speed = 0
      elsif event.key == 'w' || event.key == 'up' 
        @x_speed = 0
        @y_speed = -1
      elsif event.key == 's' || event.key == 'down' 
        @x_speed = 0
        @y_speed = 1
      end
    end
  end

end