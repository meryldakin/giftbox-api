class ChangeEventsListColumnDate < ActiveRecord::Migration[5.1]
  def change
    add_column :event_lists, :date, :date
    remove_column :event_lists, :day
    remove_column :event_lists, :month

  end
end
