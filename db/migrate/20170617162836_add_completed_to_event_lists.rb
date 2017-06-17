class AddCompletedToEventLists < ActiveRecord::Migration[5.1]
  def change
    add_column :event_lists, :completed, :boolean
  end
end
