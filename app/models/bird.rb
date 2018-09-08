class Bird
  attr_reader :common_name,
              :scientific_name,
              :location,
              :observation_date,
              :lat,
              :long

  def initialize(attributes)
    @common_name = attributes[:comName]
    @scientific_name = attributes[:sciName]
    @location = attributes[:locName]
    @observation_date = attributes[:obsDt]
    @lat = attributes[:lat]
    @long = attributes[:lng]
    @private = attributes[:locationPrivate]
  end

  def private_location?
    if @private
      "This observation was taken at a private location"
    else
      "This observation was taken at a public location"
    end
  end
end
