class AddFestivalIdToPlaylists < ActiveRecord::Migration
  def change
    add_reference :playlists, :festival, index: true
  end
end
