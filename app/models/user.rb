class User < ApplicationRecord
  belongs_to :account
  has_and_belongs_to_many :gifts
  has_and_belongs_to_many :events
end
