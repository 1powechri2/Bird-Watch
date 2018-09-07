class BirdPresenter
  def initialize(zip)
    @coordinates = LocationService.new(zip)
  end

  def bird_info
    @coordinates.zip_into_lat_and_long_coordinates_hash
    binding.pry
  end
end
