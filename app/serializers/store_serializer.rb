class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :website

  has_many :gifts
end
