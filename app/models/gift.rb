class Gift < ApplicationRecord
  has_many :stores, :users, :events
end
