require 'rails_helper'

describe 'A user can see latest bird sightings' do
  context 'from the hompage the user' do
    it 'clicks the link and ends up on the search page' do
      VCR.use_cassette("location_sightings") do
        visit root_path

        click_on 'click here'

        expect(current_path).to eq(locations_path)

        fill_in 'Zip', with: 80203

        click_on 'Get Location Data'

        expect(current_path).to eq(zip_location_path)
      end
    end
  end
end
