class LocationPresenter
  attr_reader :states,
              :state

  def initialize(state = nil)
    @states = ['AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC',
    'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA',
    'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 'NC', 'ND', 'NE',
    'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC',
    'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY']
    @state = state
    @service = BirdService.new(state)
  end

  def state_counties
    @service.counties.map do |hash|
      [hash[:name], hash[:code]]
    end
  end
end
