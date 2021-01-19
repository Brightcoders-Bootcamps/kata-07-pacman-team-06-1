require 'ruby2d'

@pacman = Circle.new( x: 200 , y: 100, radius: 15, sectors: 32, color: 'yellow', z: 10 )


@x_speed = 0
@y_speed = 0
places = Array.new
score = 0


on :key_down do |event|
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

score_text = Text.new(
  "%03d" % score,
  x: 530,
  y: 10,
  color: 'white',
  size: 20,
  opacity: 1
)

update do
	puts @pacman.x
	if (@pacman.x + @x_speed).between?(500, 580)
		@pacman.x = @pacman.x
	else
		@pacman.x += @x_speed
	end
  @pacman.y += @y_speed
  fruit = places.select {|fruit| fruit.x.between?(@pacman.x - 20, @pacman.x + 20) && fruit.y.between?(@pacman.y - 20, @pacman.y + 20)}
  unless fruit[0].class  == NilClass
  	 fruit[0].remove; score_text.text = "Score: #{score+=1 }"
  	 places.delete(fruit[0])
  end
 

end

set title: 'Pacman',
    background: 'black',
    width: 640,
    height: 480,
    resizable: false

#paredes inicio
Square.new(
  x: 500, y: 80,
  size: 80,
  color: 'blue',
  z: 20
)

Square.new(
  x: 300, y: 80,
  size: 80,
  color: 'blue',
  z: 20
)

Square.new(
  x: 100, y: 80,
  size: 80,
  color: 'blue',
  z: 20
)

Line.new(
  x1: 90, y1: 265,
  x2: 550, y2: 265,
  width: 25,
  color: 'lime',
  z: 20
)

Square.new(
  x: 500, y: 360,
  size: 80,
  color: 'blue',
  z: 20
)

Square.new(
  x: 300, y: 360,
  size: 80,
  color: 'blue',
  z: 20
)

Square.new(
  x: 100, y: 360,
  size: 80,
  color: 'blue',
  z: 20
)

#paredes fin

#
(50..get(:height)).each do |height|
	(50..get(:width)).each do |width|
		 if width % 25 == 0 && height % 25 == 0
		 	places << Circle.new( x: width , y: height, radius: 4, sectors: 32, color: 'orange', z: 10 )
		 end
	end
end

show