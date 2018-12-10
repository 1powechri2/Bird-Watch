class Bird
  attr_reader :common_name,
              :scientific_name,
              :location,
              :observation_date,
              :lat,
              :long,
              :private

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
      I18n.t 'bird.private_location'
    else
      I18n.t 'bird.public_location'
    end
  end
end
