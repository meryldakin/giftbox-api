class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :account_id


  has_many :users_events
  has_many :events, through: :users_events

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :gifts
  has_many :exchanges, through: :gifts

end
