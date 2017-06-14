class Friendship < ApplicationRecord

  belongs_to :user
  belongs_to :friend, class_name: 'User'
  has_many :celebrations
  has_many :exchanges, through: :celebrations
  has_many :event_lists, through: :celebrations
  has_many :gifts, through: :exchanges


end
