require 'rails_helper'

describe 'A user can see latest bird sightings' do
  context 'from the hompage the user clicks the link and ends up on the search page' do
    it 'fills in the zip field and finds bird data for that field' do
      VCR.use_cassette("location_sightings", :record => :new_episodes) do
        visit root_path

        click_on 'click here'

        expect(current_path).to eq(locations_path)

        fill_in 'Zip', with: 80203

        click_on 'Get Location Data'

        expect(page.status_code).to be(200)
        expect(current_path).to eq(zip_location_path)
        expect(page).to have_content('10 Results')
        expect(page).to have_content('Scientific Name: Anatinae sp.')

        click_on 'Next'

        expect(page.status_code).to be(200)
        expect(page).to have_content('Scientific Name: Colaptes auratus')
        expect(page).to_not have_content('Scientific Name: Anatinae sp.')

        click_on 'Previous'
        expect(page).to have_content('Scientific Name: Anatinae sp.')
      end
    end
  end
end
