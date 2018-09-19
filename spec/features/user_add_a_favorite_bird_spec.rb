require 'rails_helper'

describe 'a user can add a favorite bird' do
  context 'from the bird show page' do
    xit 'clicks add to favorites' do
      user = User.create(uid: 'kjdkjffd', first_name: 'kljhfah', last_name: ';ajksdfjh', email: 'd@d.D')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      page.select 'CO', from: :state

      click_on 'Get Counties By State'

      expect(current_path).to eq(state_location_path)

      page.select 'Denver', from: :county

      click_on 'Get Birds By County'

      expect(current_path).to eq(county_birds_path)

      click_on 'Add To Favorites'
    end
  end
end
