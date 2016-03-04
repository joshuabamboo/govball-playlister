class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :artist_id
      t.integer :festival_day

      t.timestamps null: false
    end
    add_index :performances, :artist_id
    add_index :performances, :festival_day
  end
end
