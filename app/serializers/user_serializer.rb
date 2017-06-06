class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName

  has_many :gifts
  has_many :events
  has_many :friends, through: :friendships
end
