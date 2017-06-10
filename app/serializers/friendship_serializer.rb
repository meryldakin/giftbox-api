class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :friend

  has_many :celebrations
  # has_many :exchanges, through: :celebrations
  # has_many :events, through: :celebrations
  # has_many :gifts, through: :exchanges

end
