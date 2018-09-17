require 'rails_helper'

describe MapPresenter do
  context 'methods' do
    it 'can create geoJson' do
      attributes1 = {comName: "Common Nighthawk",
                    sciName: "Chordeiles minor",
                    locName: "Garland Park",
                    obsDt: "2018-09-12 19:30",
                    lat: 39.69485770000001,
                    lng: 104.9179745,
                    locationPrivate: true}

      attributes2 = {comName: "Common Nighthawk",
                    sciName: "Chordeiles minor",
                    locName: "Garlajhnd Park",
                    obsDt: "2018-09-12 19:30",
                    lat: 39.694847700000004,
                    lng: 14.9179745,
                    locationPrivate: true}

      bird1 = Bird.new(attributes1)
      bird2 = Bird.new(attributes2)

      birds = [bird1, bird2]
      map = MapPresenter.new(birds)
      expect(map.geo_json).to eq([{"type": "Feature",
                                  "geometry": {
                                  "type": "Point",
                                  "coordinates": [bird1.long, bird1.lat]
                                  },
                                  "properties": {
                                  "location": bird1.location,
                                  "common_name": bird1.common_name,
                                  "scientific_name": bird1.scientific_name,
                                  "time": bird1.observation_date}
                                  },
                                  {"type": "Feature",
                                  "geometry": {
                                  "type": "Point",
                                  "coordinates": [bird2.long, bird2.lat]
                                  },
                                  "properties": {
                                  "location": bird2.location,
                                  "common_name": bird2.common_name,
                                  "scientific_name": bird2.scientific_name,
                                  "time": bird2.observation_date
                                  }}])
    end
  end
end
