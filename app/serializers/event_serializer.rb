class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :type

  has_many :users_gifts
  has_many :users_events
  has_many :gifts, through: :users_gifts
  has_many :users, through: :users_events
end
