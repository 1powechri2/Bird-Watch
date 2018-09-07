class BirdsController < ApplicationController
  def index
    @bird_info = BirdPresenter.new(params[:location][:zip]).bird_info
  end
end
