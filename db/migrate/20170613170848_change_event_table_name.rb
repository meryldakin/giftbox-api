class ChangeEventTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :events, :event_lists
  end
end
