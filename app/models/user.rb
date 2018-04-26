class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :user_events
  has_many :events, through: :users
end
