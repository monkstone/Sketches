class Particle
  include Processing::Proxy

  attr_reader :energy

  def initialize(location, image)
    #Energy = constant for now. Reduces over time and eventually particle
    #dies off
    @energy = 1000
    @position = location.get
    @size = 5
    @image = image #load_image('troll.png')
  end

  def update
    x = rand(-3.0..3.0)
    y = rand(-3.0..3.0)
    update_position
    update_size
    #stroke(255, @energy)
    #fill(255, @energy)
    #ellipse(@position.x, @position.y, @size, @size)
    $app.image(@image, @position.x, @position.y, 10, 10)
    @energy -= 1
  end

  def update_position
    mouse_vector = PVector.new($app.mouse_x, $app.mouse_y)
    dist_from_mouse = @position.dist mouse_vector
    if dist_from_mouse < 40
      diff = PVector.sub(mouse_vector, @position)
      diff.mult(-1)
      @position.add(diff)
    end
    @position.add PVector.new(rand(-2.0..2.0), rand(-2.0..2.0))
  end

  def update_size
    @size = $app.map(@energy, 0, 1000, 0, 5)
  end

end
