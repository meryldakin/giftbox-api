class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :website

  has_many :gifts_stores
  has_many :gifts, through: :gifts_stores
end
