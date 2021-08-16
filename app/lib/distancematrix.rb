class Distancematrix 
  def self.call(point_to, point_from)
    distance_url = "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{point_from}&destinations=#{point_to}&key=#{ENV["DM_TOKEN"]}"
    distance_json= JSON.parse(open(distance_url).string)
    distance = (distance_json["rows"][0]["elements"][0]["distance"]["text"]).tr('^0-9.', '')
  end
end