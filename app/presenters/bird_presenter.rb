class BirdPresenter
  attr_reader :locale
  
  def initialize(locale)
    @locale = locale
  end

  def coordinates
    LocationService.new(@locale)
  end

  def location_info
    coordinates.zip_into_lat_and_long_coordinates_hash
  end

  def birds_data
    BirdService.new(location_info).birds
  end

  def birds
    birds_data.map do |attributes|
      Bird.new(attributes)
    end
  end

  def county_bird_data
    BirdService.new(@locale).county_birds
  end

  def county_birds
    county_bird_data.map do |attributes|
      Bird.new(attributes)
    end
  end
end
