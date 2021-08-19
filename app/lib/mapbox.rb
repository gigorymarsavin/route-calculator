class Mapbox
  def self.call(point_to, point_from)
    url_point_to = URI.open("https://api.mapbox.com/geocoding/v5/mapbox.places/#{point_to}.json?access_token=#{ENV["MAPBOX_TOKEN"]}").string
    json_point_to = JSON.parse(url_point_to)
    lat_point_to = json_point_to['features'][0]['geometry']['coordinates'][0]
    lon_point_to = json_point_to['features'][0]['geometry']['coordinates'][1]

    url_point_from = URI.open("https://api.mapbox.com/geocoding/v5/mapbox.places/#{point_from}.json?access_token=#{ENV["MAPBOX_TOKEN"]}").string
    json_point_from = JSON.parse(url_point_from)        
    lat_point_from = json_point_from['features'][0]['geometry']['coordinates'][0]
    lon_point_from = json_point_from['features'][0]['geometry']['coordinates'][1]

    distance_url = URI.open("https://api.mapbox.com/directions/v5/mapbox/driving/#{lon_point_from},#{lat_point_from};#{lon_point_to},#{lat_point_to}?access_token=#{ENV["MAPBOX_TOKEN"]}").string
    distance_json = JSON.parse(distance_url)
    distance = distance_json["routes"][0]["distance"] / 1000.0
  end 
end