class LocationController < ApplicationController
  def new
    @location = LocationPresenter.new
  end
end
