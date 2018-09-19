require 'rails_helper'

describe User do
  context 'relationships' do
    it { should have_many(:user_birds) }
    it { should have_many(:data_base_birds).through(:user_birds) }
  end
end
