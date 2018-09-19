require 'rails_helper'

describe DataBaseBird do
  it 'can create a bird database object' do
    bird = DataBaseBird.create(comName: "Dood",
                        sciName: "Doodicus",
                        locName: "Our house",
                        obsDt: "Nowtober 45, 202022",
                        lat: '34.333',
                        lng: '-01.001',
                        locationPrivate: true)

    bird = DataBaseBird.find(bird.id)
    
    expect(bird.comName).to eq("Dood")
    expect(bird.sciName).to eq("Doodicus")
    expect(bird.locName).to eq("Our house")
    expect(bird.obsDt).to eq("Nowtober 45, 202022")
    expect(bird.lat).to eq('34.333')
    expect(bird.lng).to eq('-01.001')
    expect(bird.locationPrivate).to eq(true)
  end
end
