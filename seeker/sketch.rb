require_relative './vehicle'

def settings
  size(640, 360)
end

def setup
  sketch_title 'Seeker'
  @v = Vehicle.new(width / 2, height / 2)
end

def draw
  background(255)

  mouse = Vec2D.new(mouse_x, mouse_y)

  # Draw an ellipse at the mouse location
  fill(200)
  stroke(0)
  stroke_weight(2)
  ellipse(mouse.x, mouse.y, 48, 48)

  # Call the appropriate steering behaviors for our agents
  @v.seek(mouse)
  @v.run
end
