class Gift < ApplicationRecord
  belongs_to :user

  has_many :exchanges
  has_many :celebrations, through: :exchanges
  has_many :event_lists, through: :celebrations
  has_many :friendships, through: :celebrations
  has_many :friends, through: :friendships

  # has_many :gifts_events
  # has_many :events, through: :gifts_events

  has_many :gifts_stores
  has_many :stores, through: :gifts_stores
end
