class MapController < ApplicationController
  def show
    @map = MapPresenter.new(params[:recent_number], params[:birds])
  end
end
