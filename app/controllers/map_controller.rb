class MapController < ApplicationController
  def show
    @map = MapPresenter.new(params[:recent_number], current_birds)
  end
end
