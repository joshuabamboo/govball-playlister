class RemoveTypeFromPlaylists < ActiveRecord::Migration
  def change
    remove_column :playlists, :type
  end
end
