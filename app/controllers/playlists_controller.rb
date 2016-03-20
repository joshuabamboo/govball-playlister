class PlaylistsController < ApplicationController
  def new
    @user = current_user
    @playlist = Playlist.new
  end

  def create
    # client = SpotifyClient.new
    playlist = Playlist.new
    # playlist.new_playlist("GovBall Top Tracks")
    playlist.get_top_tracks_for("Governors Ball", current_user)
  end
end
