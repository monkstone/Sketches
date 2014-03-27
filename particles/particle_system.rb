require_relative './particle'

class ParticleSystem

  def initialize(count, origin)
    @particles = []
    @image = $app.load_image('logo.jpg')
    @origin = origin

    count.times do
      @particles.push Particle.new(PVector.new(origin.x, origin.y), @image)
    end
  end

  def update
    @particles.each do |p|
      if p.energy == 0
        @particles.delete p
      end
      p.update
    end
  end

  def add_particle
    @particles.push(Particle.new(PVector.new(@origin.x, @origin.y), @image))
  end
end
