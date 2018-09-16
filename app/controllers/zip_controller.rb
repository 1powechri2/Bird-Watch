class ZipController < ApplicationController
  def index
    bird_data = BirdPresenter.new(params[:zip])
    @birds = bird_data.birds.paginate(:page => params[:page], :per_page => 12)
    @map_geo_json = MapPresenter.new(bird_data.birds).geo_json.paginate(:page => params[:page], :per_page => 12)
  end
end
