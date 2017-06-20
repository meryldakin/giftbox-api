class DropTableUsersEventsLists < ActiveRecord::Migration[5.1]
  def change
    drop_table :users_events_lists
  end
end
