class ZipController < ApplicationController
  def index
    @birds = BirdPresenter.new(params[:zip]).birds.paginate(:page => params[:page], :per_page => 10)
  end
end
