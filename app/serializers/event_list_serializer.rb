class EventListSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :category, :completed

  has_many :celebrations
  has_many :friendships, through: :celebrations
  has_many :friends, through: :friendships
  
end
