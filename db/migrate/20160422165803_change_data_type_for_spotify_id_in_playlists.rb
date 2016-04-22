class ChangeDataTypeForSpotifyIdInPlaylists < ActiveRecord::Migration
  def change
    change_column :playlists, :spotify_id, :string
  end
end
