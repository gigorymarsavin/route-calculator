require_relative 'calculator'

class Proxy 
  def self.call(point_from, point_to, service)
    distance = Object.const_get("#{service}").call(point_to, point_from)
  end
end