class PlaylistsController < ApplicationController

  def new
    @user = current_user
    @playlist = Playlist.new
  end

  def create
    playlist = Playlist.new
    tracks = playlist.get_top_tracks_for("Governors Ball", current_user)
    pl = playlist.generate_playlist(tracks)
    playlist.create_from_spotify(pl, current_user)
    if playlist.save
      redirect_to playlist
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @embed_data = @playlist.link.match(/spotify.com\/(.*)/)[1].gsub('/', '%3A')
  end
end
