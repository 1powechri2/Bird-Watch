class StateController < ApplicationController
  def index
    @locations = LocationPresenter.new(params[:state])
  end
end
