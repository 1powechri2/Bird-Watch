require 'rails_helper'

describe 'A user can see latest bird sightings' do
  context 'from the hompage the user clicks the link and ends up on the search page' do
    it 'fills in the county field and finds bird data for that field' do
      VCR.use_cassette('map') do
        visit locations_path

        page.select 'CO', from: :state

        click_on 'Get Counties By State'

        expect(current_path).to eq(state_location_path)

        page.select 'Denver', from: :county

        click_on 'Get Birds By County'

        expect(current_path).to eq(county_birds_path)

        page.select 5, from: :recent_number

        click_on 'Get Map'

        expect(current_path).to eq(bird_map_path)
      end
    end
  end
end
