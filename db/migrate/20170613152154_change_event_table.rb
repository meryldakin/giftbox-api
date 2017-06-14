class ChangeEventTable < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :day, :integer
    add_column :events, :month, :integer
    add_column :events, :category, :string
    remove_column :events, :date
    remove_column :events, :type        
  end
end
