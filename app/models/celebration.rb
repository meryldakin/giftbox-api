class Celebration < ApplicationRecord
  belongs_to :friendship
  belongs_to :event
end
