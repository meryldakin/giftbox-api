class GiftSerializer < ActiveModel::Serializer
  attributes :id, :item, :category, :price, :link

  has_many :users
  has_many :events
  has_many :stores
end
