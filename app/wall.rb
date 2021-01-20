class Wall
    attr_reader :wall2d

    def initialize(x, y)
        @x1_position = x
        @y1_position = y
     

        @wall2d = Square.new(x: x, y: y,size: 70,color: 'blue',z: 10)
    end    

    # eliminar
    def remove
        @wall2d.remove
    end

    # retornar un array con x, y
    def get_coordinates
    end
end