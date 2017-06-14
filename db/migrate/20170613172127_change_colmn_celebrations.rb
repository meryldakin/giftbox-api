class ChangeColmnCelebrations < ActiveRecord::Migration[5.1]
  def change
    rename_column :celebrations, :event_id, :event_list_id
    rename_column :users_events, :event_id, :event_list_id
  end
end
