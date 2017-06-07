class GiftsEvent < ApplicationRecord
  belongs_to :gift
  belongs_to :event
end
