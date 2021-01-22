class Wall
  attr_reader :wall2d, :x, :y, :width, :height

  def initialize(x, y)
      @wall2d = Square.new(x: x, y: y,size: 70,color: 'blue',z: 10)
      @x = x
      @y = y
      @width = @wall2d.width
      @height = @wall2d.height
  end    
end