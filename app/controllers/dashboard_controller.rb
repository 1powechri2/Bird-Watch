class DashboardController < ApplicationController
  def index
    @location = LocationPresenter.new
  end
end
