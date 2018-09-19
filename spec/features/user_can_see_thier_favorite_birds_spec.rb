require 'rails_helper'

describe 'A user can see their list of favorite Birds' do
  context 'user show page' do
    it 'sees a list of favorite birds' do
      user = User.create(uid: 'kjdkjffd', first_name: 'kljhfah', last_name: ';ajksdfjh', email: 'd@d.D')

      attributes = {comName: "Dood",
                    sciName: "Doodicus",
                    locName: "Our house",
                    obsDt: "Nowtober 45, 202022",
                    lat: '34.333',
                    lng: '-01.001',
                    locationPrivate: true
                   }
      bird = Bird.new(attributes)

      db_bird = DataBaseBird.create(comName: bird.common_name,
                          sciName: bird.scientific_name,
                          locName: bird.location,
                          obsDt: bird.observation_date,
                          lat: bird.lat,
                          lng: bird.long,
                          locationPrivate: bird.private)

      user_bird = UserBird.create(user_id: user.id, data_base_bird_id: db_bird.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)
    end
  end
end
