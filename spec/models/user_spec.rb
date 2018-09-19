require 'rails_helper'

describe User do
  context 'relationships' do
    it { should have_many(:user_birds) }
    it { should have_many(:data_base_birds).through(:user_birds) }
  end
  it 'can have many data_base_birds' do
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

    db_bird = DataBaseBird.create(common_name: bird.common_name,
                        scientific_name: bird.scientific_name,
                        location: bird.location,
                        observation_date: bird.observation_date,
                        lat: bird.lat,
                        long: bird.long,
                        private: bird.private)

    user_bird = UserBird.create(user_id: user.id, data_base_bird_id: db_bird.id)

    expect(user.data_base_birds).to eq([db_bird])
  end
end
