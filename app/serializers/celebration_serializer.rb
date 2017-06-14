class CelebrationSerializer < ActiveModel::Serializer
  attributes :id, :event_list, :friendship

  has_many :exchanges

end
