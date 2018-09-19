class User < ApplicationRecord
  validates_uniqueness_of :uid
  has_many :user_birds
  has_many :data_base_birds, through: :user_birds
end
