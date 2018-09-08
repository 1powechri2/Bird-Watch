class BirdPresenter
  def initialize(locale)
    @coordinates = LocationService.new(locale)
  end

  def locatio_info
    @coordinates.zip_into_lat_and_long_coordinates_hash
  end

  def birds_data(location = locatio_info)
    BirdService.new(location).birds
  end

  def birds
    birds_data.map do |attributes|
      Bird.new(attributes)
    end
  end
end
