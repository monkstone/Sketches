require_relative './vehicle'

def setup
  size(640, 360)
  @v = Vehicle.new(width/2, height/2)
end

def draw
  background(255);

  mouse = PVector.new(mouseX, mouseY)

  # Draw an ellipse at the mouse location
  fill(200)
  stroke(0)
  stroke_weight(2)
  ellipse(mouse.x, mouse.y, 48, 48)

  # Call the appropriate steering behaviors for our agents
  @v.seek(mouse)
  @v.update
  @v.display
end
