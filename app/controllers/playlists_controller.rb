class PlaylistsController < ApplicationController
  before_action :authenticate_user

  def new
    @user = current_user
    @playlist = Playlist.new
    @festival = Festival.first #change to be dynamic later
  end

  def create
    playlist = Playlist.new
    # CUSTOM PLAYLIST
    if artist_params[:artist_ids]
      tracks = playlist.get_custom_tracks(artist_params[:artist_ids], current_user)
      spotify_pl = playlist.generate_playlist(artist_params["title"], tracks)
    else
      # TOP TRACK PLAYLISTS
      playlist = Playlist.new
      tracks = playlist.get_top_tracks_for("Governors Ball", params[:playlist_day], current_user)
      if params[:playlist_day] == "all"
        spotify_pl = playlist.generate_playlist("GovBall 2016 Top Tracks", tracks)
      else
        spotify_pl = playlist.generate_playlist("GovBall Top Tracks: #{params[:playlist_day]}", tracks)
      end
    end
    playlist.create_from_spotify(spotify_pl, current_user)
    if playlist.save
      redirect_to playlist
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @embed_data = @playlist.link.match(/spotify.com\/(.*)/)[1].gsub('/', '%3A')
  end

  def follow
    user = client
    playlist = RSpotify::Playlist.find(follow_params[:user], follow_params[:playlist])
    if playlist.is_followed_by?([user])
      user.unfollow(playlist)
    else
      user.follow(playlist)
    end
    @id = follow_params[:playlist]
  end

  private
    def client
      SpotifyClient.for(current_user)
    end

    def artist_params
      params.permit(:title, :artist_ids => [])
    end

    def follow_params
      params.permit(:user, :playlist)
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
