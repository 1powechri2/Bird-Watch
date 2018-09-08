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

  def request
    connection.get do |req|
      req.url "/ws2.0/data/obs/geo/recent?lat=#{lat}&lng=#{lng}"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-eBirdApiToken'] = ENV['BIRD_KEY']
    end
  end

  def birds
    JSON.parse(request.body, symbolize_names: true)
  end
end
