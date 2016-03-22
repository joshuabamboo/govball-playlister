class Playlist < ActiveRecord::Base
  belongs_to :user
  attr_accessor :user

  def generate_playlist(tracks)
    @user = user
    pl = client.create_playlist!("Top GovBall Tracks")
    pl.add_tracks!(tracks)
    pl
  end

  def create_from_spotify(spotify_playlist, user)
    self.update(
      type: "",
      link: spotify_playlist.external_urls['spotify'],
      user_id: user.id
    )
  end

  def get_top_tracks_for(festival_name, current_user)
    @user = current_user
    artists = Artist.all.select do |artist_object|
      artist_object.festival_days.first.festival.name == festival_name
    end

    client
    spotify_artists = []
    artists.select do |artist|
      spotify_artists << RSpotify::Artist.search(artist.name).first
    end

    tracks = []
    spotify_artists.collect do |artist|
      tracks << artist.top_tracks(:US).first
    end
    tracks
  end

  private
  def client
    SpotifyClient.for(user)
  end
end
