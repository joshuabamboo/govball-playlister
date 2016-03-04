class CreateFestivals < ActiveRecord::Migration
  def change
    create_table :festivals do |t|
      t.string :name
      t.integer :year
      t.integer :organizer_id
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps null: false
    end
    add_index :festivals, :organizer_id
  end
end
