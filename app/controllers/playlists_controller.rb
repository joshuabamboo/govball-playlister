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

  private
    def client
      SpotifyClient.for(current_user)
    end
end

# identify the festival... need festival id or name in params
# get the lineup
# lineup = Festival.find(id).get_lineup

# get the top songs
# Artist#top_track
# Playlist.new.tracks << Song.new.top_track(artist)
# lineup.each {|artist| playlist_tracks << artist.top_track}

# generate playlist
# Playlist.new.generate_playlist(title, playlist_tracks)
