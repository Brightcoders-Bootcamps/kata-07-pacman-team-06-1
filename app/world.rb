class World
    def initialize
        create_world("Pacman Game")
    end

    def create_world(title)
        set title: title,
        background: 'black',
        width: 640,
        height: 480,
        resizable: false
    end
end