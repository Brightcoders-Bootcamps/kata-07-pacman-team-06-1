require 'ruby2d'
class Text2d
    def initialize(x, y, text)
        @x = x
        @y = y
        @text = text
        @text2d = Text.new("%03d" % text, x: 530, y: 10, color: 'white', size: 20, opacity: 1 )
    end

    def add_score(value)
        @text += value
        @text2d.text = "Score %03d" % @text
    end
end