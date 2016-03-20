class Playlist < ActiveRecord::Base
  belongs_to :user
  attr_accessor :user

  def generate_playlist(user)
    @user = user
    # get the tracks
    # create spotify playlist
    pl = client.create_playlist!(tracks)
    # save playlist to db
    create_from_spotify(pl)
  end

  def create_from_spotify(spotify_playlist)
    self.create(
      binding.pry
    )
  end

##################

  def generate_top_tracks_playlist
    playlist = client.create_playlist!("GovBall Top Tracks")
    playlist.add_tracks!(get_top_tracks)
  end

  def get_top_tracks_for(festival_name, current_user)
    @user = current_user
    artists = Artist.all.select do |artist_object|
      artist_object.festival_days.first.festival.name == festival_name
    end

    spotify_artists = []
    artists.select do |artist|
      client
      spotify_artists << RSpotify::Artist.search(artist.name).first
    end

    tracks = []
    spotify_artists.collect do |artist|
      binding.pry
      tracks << artist.top_tracks(:US).first
    end
    tracks
  end

  private
  def client
    SpotifyClient.for(user)
  end
end


# p = Playlist.new
# p.client.create_playlist!(tracks)
#
# login
# click generate Playlist
# create a playlist of with all artists
#  - get all artists
#  - get their top track
#  - add tracks to a new playlist
#  -
