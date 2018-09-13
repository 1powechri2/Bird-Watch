class CountyController < ApplicationController
  def index
    bird_info = BirdPresenter.new(params[:county])
    @birds = bird_info.county_birds.paginate(:page => params[:page], :per_page => 12)
    @locale = bird_info.locale
    @recent_sightings_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                              11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  end
end
