class CountyController < ApplicationController
  def index
    bird_info = BirdPresenter.new(params[:county])
    @birds = bird_info.county_birds.paginate(:page => params[:page], :per_page => 12)
    @map_geo_json = MapPresenter.new(bird_info.county_birds).geo_json.paginate(:page => params[:page], :per_page => 12)
  end
end
