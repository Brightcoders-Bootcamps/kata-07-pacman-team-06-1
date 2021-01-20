require 'ruby2d'

class WindowGame
    attr_reader :window

    def initialize
        create_window
        @window = Window
    end

    def create_window
       Window.set(title: 'Pacman Game', background: 'black', width: 640, height: 480, resizable: false)
    end

    def update_window
        @window.update do
            yield
        end
    end
    
end