class GiftSerializer < ActiveModel::Serializer
  attributes :id, :item, :category, :price, :link

  has_many :users_gifts
  has_many :gifts_stores
  has_many :users, through: :users_gifts
  has_many :events, through: :users_gifts
  # has_many :friends, through: :users_gifts
  has_many :stores, through: :users_stores
end
