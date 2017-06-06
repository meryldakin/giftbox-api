class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :website

  has_and_belongs_to_many :gifts
end
