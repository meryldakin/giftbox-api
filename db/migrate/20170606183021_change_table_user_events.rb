class ChangeTableUserEvents < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_events, :users_events
  end
end
