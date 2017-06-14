class UsersEvent < ApplicationRecord
  belongs_to :event_list
  belongs_to :user
end
