class CountyController < ApplicationController
  def index
    @birds = BirdPresenter.new(params[:county]).county_birds.paginate(:page => params[:page], :per_page => 12)
  end
end
