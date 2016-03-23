class PlaylistsController < ApplicationController

  def new
    @user = current_user
    @playlist = Playlist.new
  end

  def create
    playlist = Playlist.new
    tracks = playlist.get_top_tracks_for("Governors Ball", params[:playlist_day], current_user)
    if params[:playlist_day] == "all"
      pl = playlist.generate_playlist("GovBall 2016 Top Tracks", tracks)
    else
      pl = playlist.generate_playlist("GovBall Top Tracks: #{params[:playlist_day]}", tracks)
    end
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
