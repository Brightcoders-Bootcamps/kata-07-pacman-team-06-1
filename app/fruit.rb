class Fruit
    attr_reader :x, :y, :fruit
    def initialize(x, y)
        @x = x
        @y = y
        @fruit = Circle.new( x: x , y: y, radius: 4, color: 'orange', z: 1 )
    end

    def get_coordinates
        return [self.x, self.y]
    end

end