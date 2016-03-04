class CreateFestivalDays < ActiveRecord::Migration
  def change
    create_table :festival_days do |t|
      t.datetime :start_date
      t.datetime :finish_date
      t.integer :festival_id

      t.timestamps null: false
    end
    add_index :festival_days, :festival_id
  end
end
