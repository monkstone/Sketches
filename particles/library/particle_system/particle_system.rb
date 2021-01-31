# frozen_string_literal: true

require_relative './particle'

class ParticleSystem
  attr_reader :origin, :particles

  def initialize(count, origin)
    @origin = origin
    @particles = (0..count).map do
      Particle.new(Vec2D.new(origin.x, origin.y))
    end
  end

  def update
    particles.each do |p|
      particles.delete p if p.energy.zero?
      p.update
    end
  end

  def add_particle
    particles << Particle.new(Vec2D.new(origin.x, origin.y))
  end

  def run
    add_particle
    update
  end
end
