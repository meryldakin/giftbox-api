class GiftEvents < ApplicationRecord
  belongs_to :gift
  belongs_to :event
end
