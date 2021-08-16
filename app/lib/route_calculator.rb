require 'open-uri'
require 'json'

require_relative 'proxy'
require_relative 'distanceorg'

module RouteCalculator
  def self.call(point_from, point_to, service, height, width, length, weight)
    distance = Proxy.new.call(point_from, point_to, service, height, width, length, weight)
    Calculator.call(height, width, length, weight, distance)
  end
end
