class MapPresenter
  attr_reader :birds

  def initialize(birds)
    @birds = birds
  end

  def geo_json
    geo_jsons = []
    count = 0.0
    @birds.each do |bird|
      count += 0.00001
      geo_jsons << to_geo_json((bird.lat + count), bird.long, bird.location,
                               bird.common_name, bird.scientific_name, bird.observation_date)
    end
    geo_jsons
  end

  def to_geo_json(lat, long, location, common_name, scientific_name, observation_date)
    {"type": "Feature",
    "geometry": {
    "type": "Point",
    "coordinates": [long, lat]
    },
    "properties": {
    "location": location,
    "common_name": common_name,
    "scientific_name": scientific_name,
    "time": observation_date}
    }
  end
end
