require 'open-uri'
require 'json'
require_relative 'api'
require_relative 'calculator'
require_relative 'error'

class RouteCalculate
  def self.get_price(point_from, point_to, service, height, width, length, weight)
    raise SizeError if height.to_i <= 0 || width.to_i <= 0 || length.to_i <= 0 || weight <= 0
    api = Api.new
    distance = api.send(service,point_from, point_to)
    Calculator.calculate(height, width, length, weight, distance)
  end 
end