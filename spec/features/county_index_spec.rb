require 'rails_helper'

describe 'A user can see latest bird sightings' do
  context 'from the hompage the user clicks the link and ends up on the search page' do
    xit 'fills in the county field and finds bird data for that field' do
      VCR.use_cassette("county_birds") do
        visit root_path

        click_on 'click here'

        expect(current_path).to eq(locations_path)

        page.select 'CO', from: :state

        click_on 'Get Counties By State'

        expect(current_path).to eq(state_location_path)

        page.select 'Denver', from: :county

        click_on 'Get Birds By County'

        expect(page.status_code).to be(200)
        expect(page).to have_content('HERE ARE THE LATEST RESULTS FOR THE COUNTY YOU PROVIDED')
      end
    end
  end
end
