require 'rails_helper'

describe UserBird do
  context 'relationships' do
    it {should belong_to(:user)}
    it {should belong_to(:data_base_bird)}
  end
end
