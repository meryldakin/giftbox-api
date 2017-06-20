class EventList < ApplicationRecord
  belongs_to :user

  # has_many :gifts_events
  # has_many :gifts, through: :gifts_events

  has_many :celebrations
  has_many :friendships, through: :celebrations
  has_many :friends, through: :friendships
  has_many :exchanges, through: :celebrations
  has_many :gifts, through: :exchanges



end
