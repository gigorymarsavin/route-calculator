require 'open-uri'
require 'json'
require_relative 'proxy'
require_relative 'distanceorg'

module RouteCalculator
  def self.call(hash={})
    distance = Proxy.call(hash[:addr_from], hash[:addr_to], 'Distanceorg')
    Calculator.call(distance, hash)
  end
end
