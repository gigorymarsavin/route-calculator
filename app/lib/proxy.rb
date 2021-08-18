require_relative 'calculator'

class Proxy
  attr_reader :point_from, :point_to, :service

  def initialize(point_from, point_to, service)
    @point_from = point_from
    @point_to = point_to
    @service = 'Distanceorg'
  end

  def call
    distance = Object.const_get("#{@service}").call(@point_to, @point_from)
  end
end