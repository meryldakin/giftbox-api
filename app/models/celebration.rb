class Celebration < ApplicationRecord
  belongs_to :friendship
  belongs_to :event, optional: true
  has_many :exchanges

  before_save :default_values

  def default_values
    self.event ||= Event.find(2) if self.event.nil? #note: Event with id 2 is "Anytime"
  end
end
