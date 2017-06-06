class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :month
      t.integer :day
      t.integer :year
      t.date :date
      t.string :type
      t.timestamps
    end
  end
end
