class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :month, :day, :year, :date, :type

  has_and_belongs_to_many :gifts
  has_and_belongs_to_many :users
end
