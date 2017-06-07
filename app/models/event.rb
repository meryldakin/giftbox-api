class Event < ApplicationRecord
  has_many :exchanges

  has_many :users_events
  has_many :users, through: :users_events

  has_many :gift_events
  has_many :gifts, through: :gift_events
  
  has_many :celebrations
  has_many :friendships, through: :celebrations
  has_many :friends, through: :friendships
end
