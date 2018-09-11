require 'rails_helper'

describe 'A user can see latest bird sightings' do
  context 'from the hompage the user clicks the link and ends up on the search page' do
    it 'fills in the county field and finds bird data for that field' do
      VCR.use_cassette("county_sightings", :record => :new_episodes) do
        visit root_path

        click_on 'click here'

        expect(current_path).to eq(locations_path)

        page.select 'CO', from: 'State'

        click_on 'Get Data By State'

        expect(current_path).to eq(state_location_path)

        page.select 'Denver', from: 'County'

        click_on 'Get Birds By County'
      end
    end
  end
end
