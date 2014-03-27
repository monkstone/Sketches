require_relative './particle_system'
def setup
  size 700, 500
  smooth
  particle_count = 100
  origin = PVector.new(width/2, height/2)
  @ps = ParticleSystem.new(particle_count, origin)
end


def draw
  background 0
  @ps.add_particle
  @ps.update
end
