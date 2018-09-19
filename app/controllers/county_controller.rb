class CountyController < ApplicationController
  def index
    bird_data = BirdPresenter.new(params[:county])
    @birds = bird_data.county_birds.paginate(:page => params[:page], :per_page => 12)
    @map_geo_json = MapPresenter.new(bird_data.county_birds).geo_json.paginate(:page => params[:page], :per_page => 12)

  end
end
