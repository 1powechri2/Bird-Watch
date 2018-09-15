class CountyController < ApplicationController
  def index
    bird_info = BirdPresenter.new(params[:county])
    @birds = bird_info.county_birds.paginate(:page => params[:page], :per_page => 12)
    @map_geo_json = MapPresenter.new(bird_info.county_birds).geo_json.paginate(:page => params[:page], :per_page => 12)
    @geo_json = [{
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [-77.032, 38.913]
      },
      properties: {
        title: 'Mapbox',
        description: 'Washington, D.C.'
      }
    },
    {
      type: 'Feature',
      geometry: {
        type: 'Point',
        coordinates: [-122.414, 37.776]
      },
      properties: {
        title: 'Mapbox',
        description: 'San Francisco, California'
      }
    }]
  end
end
