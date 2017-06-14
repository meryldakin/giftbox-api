class ChangeUserEventsTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :users_events, :users_event_lists
  end
end
