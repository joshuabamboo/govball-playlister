class Playlist < ActiveRecord::Base
  belongs_to :user

  def generate_top_tracks_playlist
    playlist = client.create_playlist!("GovBall Top Tracks")
    playlist.add_tracks!(get_top_tracks)
  end

  def get_top_tracks_for(festival_name)
    artists = Artist.all.select do |artist_object|
      artist_object.festival_days.first.festival.name == festival_name
    end

    spotify_artists = artists.each do |artist|
      binding.pry
      RSpotify::Artist.search(artist.name).first
    end

    spotify_artists.collect do |artist|
      binding.pry
      artist.top_tracks(:US)
    end
  end

  private
  def client
    SpotifyClient.for(current_user)
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
