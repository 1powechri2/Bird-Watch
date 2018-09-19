require 'rails_helper'

describe Bird do
  it 'can create a bird object' do
    attributes = {comName: "Dood",
                  sciName: "Doodicus",
                  locName: "Our house",
                  obsDt: "Nowtober 45, 202022",
                  lat: '34.333',
                  lng: '-01.001',
                  locationPrivate: true
                 }
    bird = Bird.new(attributes)

    expect(bird).to be_a(Bird)
    expect(bird.common_name).to eq(attributes[:comName])
    expect(bird.scientific_name).to eq(attributes[:sciName])
    expect(bird.location).to eq(attributes[:locName])
    expect(bird.observation_date).to eq(attributes[:obsDt])
    expect(bird.lat).to eq(attributes[:lat])
    expect(bird.long).to eq(attributes[:lng])
    expect(bird.private).to eq(attributes[:locationPrivate])
  end
end
