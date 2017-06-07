class UsersGift < ApplicationRecord
  belongs_to :gift
  belongs_to :user
  belongs_to :friend
  belongs_to :event
end
