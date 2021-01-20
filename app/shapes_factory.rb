class ShapesFactory 
    require_relative 'fruit'
    require_relative 'pacman'
    require_relative 'wall'
    require_relative 'phantom'

    class << self
        def create_shape(type, x, y)
            case type
            when 'fruit'
                create_fruit(x, y)
            when 'pacman'
                create_pacman(x, y)
            when 'phantom'
             create_phantom(x, y)
            when 'wall'
                create_wall(x, y)
            else
                puts "imposible create #{type} shape"
            end
        end
    
        def create_pacman(x, y)
            Pacman.new(x, y)
        end
    
        def create_phantom
        end
    
        def create_wall(x, y)
            Wall.new(x, y)
        end
    
        def create_fruit(x, y)
            Fruit.new(x, y)
        end
    end
end
