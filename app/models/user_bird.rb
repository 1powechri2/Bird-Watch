class UserBird < ApplicationRecord
  belongs_to :data_base_bird
  belongs_to :user
end
