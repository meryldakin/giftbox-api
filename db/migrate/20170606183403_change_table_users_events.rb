class ChangeTableUsersEvents < ActiveRecord::Migration[5.1]
  def change
    rename_table :users_events, :events_users
  end
end
