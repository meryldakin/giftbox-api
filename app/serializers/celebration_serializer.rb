class CelebrationSerializer < ActiveModel::Serializer
  attributes :id, :event

  has_many :exchanges

end
