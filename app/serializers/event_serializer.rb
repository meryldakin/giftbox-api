class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :month, :day, :year, :date, :type

  has_many :gifts
  has_many :users
end
