class Celebration < ApplicationRecord
  belongs_to :friendship
  belongs_to :event_list, optional: true
  has_many :exchanges

  before_save :default_values

  def default_values
    self.event_list ||= EventList.find(2) if self.event_list.nil? #note: Event with id 2 is "Anytime"
  end
end
