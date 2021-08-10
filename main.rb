require 'open-uri'
require 'json'
require 'require_all'
require_all 'api'
require_relative 'proxy'

class RouteCalculator  
  def self.call(point_from, point_to, service, height, width, length, weight)
    distance = Proxy.new.call(point_from, point_to, service, height, width, length, weight)
    Calculator.call(height, width, length, weight, distance)
  end
end