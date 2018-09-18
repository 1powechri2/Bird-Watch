require 'rails_helper'

describe 'A user can see latest bird sightings' do
  context 'from the hompage the user clicks the link and ends up on the search page' do
    xit 'fills in the zip field and finds bird data for that field' do
      VCR.use_cassette("zip_birds") do
        visit root_path

        click_on 'click here'

        expect(current_path).to eq(locations_path)

        fill_in :zip, with: 80203

        click_on 'Get Data By Zip'

        expect(page.status_code).to be(200)
        expect(page).to have_content('HERE ARE THE LATEST RESULTS FOR THE ZIP YOU PROVIDED')

        click_on 'Next'

        expect(page.status_code).to be(200)
        expect(page).to have_content('HERE ARE THE LATEST RESULTS FOR THE ZIP YOU PROVIDED')

        click_on 'Previous'
        expect(page.status_code).to be(200)
        expect(page).to have_content('HERE ARE THE LATEST RESULTS FOR THE ZIP YOU PROVIDED')
      end
    end
  end
end
