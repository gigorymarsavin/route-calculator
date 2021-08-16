require_relative 'calculator'

class Proxy 
  def call(point_from, point_to, service, height, width, length, weight)
    distance =  Object.const_get("#{service}").call(point_to, point_from)
  end
end