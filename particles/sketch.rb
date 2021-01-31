# frozen_string_literal: true

load_library :particle_system

attr_reader :ps, :troll

def settings
  size 700, 500
end

def setup
  sketch_title 'Particle Systems'
  particle_count = 100
  origin = Vec2D.new(width / 2, height / 2)
  @troll = load_image(data_path('troll.png'))
  @ps = ParticleSystem.new(particle_count, origin)
end

def draw
  background 0
  ps.run
end
