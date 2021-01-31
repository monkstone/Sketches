class Vehicle
  include Processing::Proxy
  MAX_SPEED = 4
  MAX_FORCE = 0.1
  SIZE = 2

  attr_reader :acceleration, :location, :velocity
  def initialize(x, y)
    @acceleration = Vec2D.new
    @velocity = Vec2D.new(0, -2)
    @location = Vec2D.new(x,y)
  end

  # Method to update location
  def update
    # Update velocity
    @velocity += acceleration
    # Limit speed
    velocity.set_mag(MAX_SPEED) { velocity.mag > MAX_SPEED }
    @location += velocity
    # Reset accelerationelertion to 0 each cycle
    @acceleration = Vec2D.new
  end

  def apply_force(force)
    # We could add mass here if we want A = F / M
    @acceleration += force
  end

  # A method that calculates a steering force towards a target
  # STEER = DESIRED MINUS VELOCITY
  def seek(target)
    #A vector pointing from the location to the target
    desired = target - location
    # Scale to maximum speed
    desired.set_mag(MAX_SPEED) { desired.mag > MAX_SPEED }

    # Steering = Desired minus velocity
    steer = desired - velocity
    steer.set_mag(MAX_FORCE) { steer.mag > MAX_FORCE } # Limit to maximum steering force
    apply_force(steer)
  end

  def display
    # Draw a triangle rotated in the direction of velocity
    theta = velocity.heading + HALF_PI
    fill(127)
    stroke(0)
    stroke_weight(1)
    push_matrix
    translate(location.x, location.y)
    rotate(theta)
    begin_shape
    vertex(0, -SIZE * 2)
    vertex(-SIZE, SIZE * 2)
    vertex(SIZE, SIZE * 2)
    end_shape(CLOSE)
    pop_matrix
  end

  def run
    update
    display
  end
end
