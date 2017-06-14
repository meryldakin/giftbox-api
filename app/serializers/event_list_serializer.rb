class EventListSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :category
  
  # has_many :users_event_lists
  # has_many :users, through: :users_event_lists

  # has_many :gifts_events
  # has_many :gifts, through: :gifts_events

  has_many :celebrations
  has_many :friendships, through: :celebrations
  has_many :friends, through: :friendships
  # has_many :exchanges, through: :celebrations
  # has_many :gifts, through: :exchanges
end
