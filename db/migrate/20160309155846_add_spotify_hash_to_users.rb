class AddSpotifyHashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rspotify_hash, :string
  end
end
