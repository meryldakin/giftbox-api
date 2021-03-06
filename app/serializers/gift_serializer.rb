class GiftSerializer < ActiveModel::Serializer
  attributes :id, :item, :category, :link, :image

  # has_many :gifts_stores
  # has_many :stores, through: :users_stores

  # has_many :exchanges
  # has_many :celebrations, through: :exchanges
  # has_many :friendships, through: :celebrations
  has_many :friends, through: :friendships
  #
  # has_many :gifts_events
  # has_many :events, through: :gifts_events

end
