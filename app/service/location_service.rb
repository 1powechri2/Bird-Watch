class LocationService
  def initialize(zip)
    @zip = zip
  end

  def connection
    Faraday.new(:url => 'https://geoservices.tamu.edu/Services/Geocode/WebService/GeocoderWebServiceHttpNonParsed_V04_01.aspx') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def zip_request
    connection.get do |req|
      req.url "?zip=#{@zip}&apikey=#{ENV['GEO_KEY']}&format=json&version=4.01"
    end
  end

  def zip_request_body
    JSON.parse(zip_request.body, symbolize_names: true)
  end

  def zip_into_lat_and_long_coordinates_hash
    {latitude: zip_request_body[:OutputGeocodes][0][:OutputGeocode][:Latitude],
    longitude: zip_request_body[:OutputGeocodes][0][:OutputGeocode][:Longitude]}
  end
end
