require 'open-uri'
require 'json'
require_relative 'proxy'
require_relative 'distanceorg'

module RouteCalculator
  def self.call(hash={})
    distance = Proxy.new(hash[:addr_from], hash[:addr_to], 'Distanceorg').call
    Calculator.new(distance, hash).call
  end
end
