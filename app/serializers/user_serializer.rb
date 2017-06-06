class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName
  belongs_to :account
  has_and_belongs_to_many :gifts
  has_and_belongs_to_many :events
end
