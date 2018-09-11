class BirdService
  def initialize(location)
    @location = location
  end

  def lat
    @location[:latitude]
  end

  def lng
    @location[:longitude]
  end

  def connection
    Faraday.new(:url => 'https://ebird.org/home') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def lat_lng_request
    connection.get do |req|
      req.url "/ws2.0/data/obs/geo/recent?lat=#{lat}&lng=#{lng}"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-eBirdApiToken'] = ENV['BIRD_KEY']
    end
  end

  def county_request
    connection.get do |req|
      req.url "/ws2.0/ref/region/list/subnational2/US-#{@location}.json"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-eBirdApiToken'] = ENV['BIRD_KEY']
    end
  end

  def county_code_request
    connection.get do |req|
      req.url "/ws2.0/data/obs/#{@location}/recent"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-eBirdApiToken'] = ENV['BIRD_KEY']
    end
  end

  def birds
    JSON.parse(lat_lng_request.body, symbolize_names: true)
  end

  def counties
    JSON.parse(county_request.body, symbolize_names: true)
  end

  def county_birds
    JSON.parse(county_code_request.body, symbolize_names: true)
  end
end
