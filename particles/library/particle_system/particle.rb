# frozen_string_literal: true

class Particle
  include Processing::Proxy

  attr_reader :energy

  def initialize(location)
    # Energy = constant for now. Reduces over time and eventually particle
    # dies off
    @energy = 1_000
    @position = location.copy
    @size = 5
  end

  def update
    x = rand(-3.0..3.0)
    y = rand(-3.0..3.0)
    update_position
    update_size
    image(troll, @position.x, @position.y, 10, 10)
    @energy -= 1
  end

  def update_position
    mouse_vector = Vec2D.new(mouse_x, mouse_y)
    dist_from_mouse = @position.dist mouse_vector
    if dist_from_mouse < 40
      diff = mouse_vector - @position
      diff *= -1
      @position += diff
    end
    @position += Vec2D.new(rand(-2.0..2.0), rand(-2.0..2.0))
  end

  def update_size
    @size = map1d(@energy, 0..1000, 0..5)
  end
end
