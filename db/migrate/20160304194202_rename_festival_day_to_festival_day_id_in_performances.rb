class RenameFestivalDayToFestivalDayIdInPerformances < ActiveRecord::Migration
  def change
    rename_column :performances, :festival_day, :festival_day_id
  end
end
