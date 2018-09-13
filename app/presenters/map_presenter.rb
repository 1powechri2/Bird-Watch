class MapPresenter
  def initialize(recent_number, birds)
    @recent_number = recent_number
    @birds = birds
  end

  def geo_json
    geo_jsons = []
    @birds.each do |bird|
      geo_jsons << to_geo_json(bird.lat, bird.long, bird.location)
    end
    geo_jsons
  end

  def to_geo_json(lat, long, location)
    {"type": "Feature",
    "geometry": {
    "type": "Point",
    "coordinates": [lat, long]
    },
    "properties": {
    "name": "#{location}"}
    }
  end
end
