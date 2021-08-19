class Distanceorg
  def self.call(point_to, point_from)
    distance_url = URI.open("https://www.distance24.org/route.json?stops=#{point_to}|#{point_from}").read
    distance = JSON.parse(distance_url)["distances"][0]
  end
end