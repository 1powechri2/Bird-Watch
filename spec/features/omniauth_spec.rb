require 'rails_helper'

describe 'A user logs in from homepage', driver: :selenium do
  it 'enters its google login info for google authorization' do
      visit root_path

      click_on "Login Using Google"
  end
end
