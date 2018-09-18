require 'rails_helper'

describe 'A user logs in from homepage' do
  it 'enters its google login info for google authorization' do
    user = User.create(uid: 'kjdkjffd', first_name: 'kljhfah', last_name: ';ajksdfjh', email: 'd@d.D')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("Welcome #{user.first_name} #{user.last_name}")
  end
end
