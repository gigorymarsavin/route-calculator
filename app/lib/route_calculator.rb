require 'open-uri'
require 'json'

require_relative 'proxy'
require_relative 'distanceorg'

module RouteCalculator
  attr_accessor :distance

  def self.call(hash={})
    distance = Proxy.new.call(hash[:addr_from], hash[:addr_to], 'Distanceorg', hash[:height], hash[:width], hash[:length], hash[:weight])
    Calculator.call(hash[:height], hash[:width], hash[:length], hash[:weight], distance)
  end
end
