class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :account_id

  has_many :users_gifts
  has_many :users_events
  has_many :friendships
  has_many :gifts, through: :users_gifts
  has_many :events, through: :users_events
  has_many :friends, through: :friendships
end
