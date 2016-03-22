class PlaylistsController < ApplicationController

  def new
    @user = current_user
    @playlist = Playlist.new
  end

  def create
    playlist = Playlist.new
    tracks = playlist.get_top_tracks_for("Governors Ball", current_user)
    playlist.generate_playlist(tracks)
  end

  def show
    @playlist = Playlist.find(params[:id])
    @embed_data = @playlist.link.match(/spotify.com\/(.*)/)[1].gsub('/', '%3A')
  end
end
