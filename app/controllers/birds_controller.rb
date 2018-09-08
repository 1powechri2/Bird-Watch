class BirdsController < ApplicationController
  def index
    @birds = BirdPresenter.new(params[:location][:zip]).birds
  end
end
