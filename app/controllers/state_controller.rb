class StateController < ApplicationController
  def index
    @counties = LocationPresenter.new(params[:state]).state_counties
  end
end
