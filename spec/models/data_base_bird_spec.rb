require 'rails_helper'

describe DataBaseBird do
  it 'can create a bird database object' do
    bird = DataBaseBird.create(common_name: "Dood",
                        scientific_name: "Doodicus",
                        location: "Our house",
                        observation_date: "Nowtober 45, 202022",
                        lat: 34.333,
                        long: -1.001,
                        private: true)

    bird = DataBaseBird.find(bird.id)

    expect(bird.common_name).to eq("Dood")
    expect(bird.scientific_name).to eq("Doodicus")
    expect(bird.location).to eq("Our house")
    expect(bird.observation_date).to eq("Nowtober 45, 202022")
    expect(bird.lat).to eq(34.333)
    expect(bird.long).to eq(-1.001)
    expect(bird.private).to eq(true)
  end
  context 'relationships' do
    it {should have_many(:user_birds)}
  end
end
