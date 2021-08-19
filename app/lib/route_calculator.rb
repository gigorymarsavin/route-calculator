require 'open-uri'
require 'json'
require_relative 'proxy'
require_relative 'distanceorg'

module RouteCalculator
  def self.call(params = {})
    Proxy.call(params)
    Calculator.call(params)
  end
end
