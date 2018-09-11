class CountyController < ApplicationController
  def index
    @birds = BirdPresenter.new(params[:county]).county_birds.paginate(:page => params[:page], :per_page => 10)
  end
end
