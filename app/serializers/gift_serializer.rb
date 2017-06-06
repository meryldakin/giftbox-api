class GiftSerializer < ActiveModel::Serializer
  attributes :id, :item, :category, :price, :link

  has_and_belongs_to_many :users
  has_and_belongs_to_many :events
  has_and_belongs_to_many :stores
end
