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
  it 'can create a bird database object' do
    bird = DataBaseBird.create(comName: "Dood",
                      sciName: "Doodicus",
                      locName: "Our house",
                      obsDt: "Nowtober 45, 202022",
                      lat: '34.333',
                      lng: '-01.001',
                      locationPrivate: true)

    expect(bird.id).to eq(1)
    expect(bird.comName).to eq("Dood")
    expect(bird.sciName).to eq("Doodicus")
    expect(bird.locName).to eq("Our house")
    expect(bird.obsDt).to eq("Nowtober 45, 202022")
    expect(bird.lat).to eq('34.333')
    expect(bird.lng).to eq('-01.001')
    expect(bird.locationPrivate).to eq(true)
  end
end
