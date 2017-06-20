class ChangeUsersEventsListTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :users_events_list, :users_events_lists
  end
end
