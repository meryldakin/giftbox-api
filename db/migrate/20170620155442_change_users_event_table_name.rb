class ChangeUsersEventTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :users_event_lists, :users_events_list
  end
end
