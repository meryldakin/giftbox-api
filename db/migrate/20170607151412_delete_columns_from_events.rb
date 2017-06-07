class DeleteColumnsFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :month
    remove_column :events, :day
    remove_column :events, :year
  end
end
