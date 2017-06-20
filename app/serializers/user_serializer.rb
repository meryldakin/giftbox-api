class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :account_id, :birthday, :notes


  has_many :friendships
  # has_many :friends, through: :friendships
  # has_many :celebrations, through: :friendships

  # has_many :gifts
  # has_many :exchanges, through: :gifts



end
