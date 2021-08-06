class Api
  attr_reader :distance 

  def distanceorg(point_to, point_from)
    distance_url = URI.open("https://www.distance24.org/route.json?stops=#{point_to}|#{point_from}").read
    distance_json = JSON.parse(distance_url)
    @distance =  distance_json["distances"][0]
  end

  def mapbox(point_to, point_from)        
    url_point_to = URI.open("https://api.mapbox.com/geocoding/v5/mapbox.places/#{point_to}.json?access_token=#{ENV["MAPBOX_API"]}").string
    json_point_to = JSON.parse(url_point_to)        
    lat_point_to = json_point_to['features'][0]['geometry']['coordinates'][0]
    lon_point_to = json_point_to['features'][0]['geometry']['coordinates'][1]

    url_point_from = URI.open("https://api.mapbox.com/geocoding/v5/mapbox.places/#{point_from}.json?access_token=#{ENV["MAPBOX_API"]}").string
    json_point_from = JSON.parse(url_point_from)        
    lat_point_from = json_point_from['features'][0]['geometry']['coordinates'][0]
    lon_point_from = json_point_from['features'][0]['geometry']['coordinates'][1]

    distance_url = URI.open("https://api.mapbox.com/directions/v5/mapbox/driving/#{lon_point_from},#{lat_point_from};#{lon_point_to},#{lat_point_to}?access_token=#{ENV["MAPBOX_API"]}").string
    distance_json = JSON.parse(distance_url)
    distance_meters = distance_json["routes"][0]["distance"]
    @distance = distance_meters / 1000.0
  end

  def matrix(point_to, point_from)
    distance_url = "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{point_from}&destinations=#{point_to}&key=#{ENV["DM_TOKEN"]}"
    distance_json= JSON.parse(open(distance_url).string)
    @distance = (distance_json["rows"][0]["elements"][0]["distance"]["text"]).tr('^0-9.', '')
  end
end

