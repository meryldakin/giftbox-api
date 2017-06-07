class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :type

  has_many :users_events
  has_many :users, through: :users_events

  has_many :gifts_events
  has_many :gifts, through: :gifts_events

  has_many :celebrations
  has_many :friendships, through: :celebrations
  has_many :friends, through: :friendships
end
