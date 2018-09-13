require 'rails_helper'

describe MapPresenter do
  context 'methods' do
    it 'can create geoJson' do
      attributes1 = {comName: "Common Nighthawk",
                    sciName: "Chordeiles minor",
                    locName: "Garland Park",
                    odsDt: "2018-09-12 19:30",
                    lat: 39.6948377,
                    lng: 104.9179745,
                    locationPrivate: true}

      attributes2 = {comName: "Common Nighthawk",
                    sciName: "Chordeiles minor",
                    locName: "Garlajhnd Park",
                    odsDt: "2018-09-12 19:30",
                    lat: 34.6948377,
                    lng: 14.9179745,
                    locationPrivate: true}

      bird1 = Bird.new(attributes1)
      bird2 = Bird.new(attributes2)

      birds = [bird1, bird2]
      map = MapPresenter.new(2, birds)

      expect(map.geo_json).to eq([{"type": "Feature",
                                  "geometry": {
                                  "type": "Point",
                                  "coordinates": [bird1.lat, bird1.long]
                                  },
                                  "properties": {
                                  "name": "#{bird1.location}"}
                                  },
                                  {"type": "Feature",
                                  "geometry": {
                                  "type": "Point",
                                  "coordinates": [bird2.lat, bird2.long]
                                  },
                                  "properties": {
                                  "name": "#{bird2.location}"}
                                  },])
    end
  end
end
