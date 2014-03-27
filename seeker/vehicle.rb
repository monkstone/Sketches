class Vehicle
  include Processing::Proxy

  def initialize(x, y)
    @acceleration = PVector.new(0,0)
    @velocity = PVector.new(0,-2)
    @location = PVector.new(x,y)
    @size = 2
    @maxspeed = 4
    @maxforce = 0.1
  end

  # Method to update location
  def update
    # Update velocity
    @velocity.add(@acceleration)
    # Limit speed
    @velocity.limit(@maxspeed)
    @location.add(@velocity)
    # Reset accelerationelertion to 0 each cycle
    @acceleration.mult(0)
  end

  def apply_force(force)
    # We could add mass here if we want A = F / M
    @acceleration.add(force)
  end

  # A method that calculates a steering force towards a target
  # STEER = DESIRED MINUS VELOCITY
  def seek(target)
    #A vector pointing from the location to the target
    desired = PVector.sub(target, @location)
    # Scale to maximum speed
    desired.setMag(@maxspeed)

    # Steering = Desired minus velocity
    steer = PVector.sub(desired, @velocity)
    steer.limit(@maxforce)  # Limit to maximum steering force
    apply_force(steer)
  end

  def display
    # Draw a triangle rotated in the direction of velocity
    theta = @velocity.heading2D + PI/2
    fill(127)
    stroke(0)
    stroke_weight(1)
    push_matrix
    translate(@location.x, @location.y)
    rotate(theta)
    begin_shape
    vertex(0, -@size*2)
    vertex(-@size, @size*2)
    vertex(@size, @size*2)
    end_shape(CLOSE)
    pop_matrix
  end
end
