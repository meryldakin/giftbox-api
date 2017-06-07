class ChangeTableNameEventUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :events_users, :users_events
  end
end
