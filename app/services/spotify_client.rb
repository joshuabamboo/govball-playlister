class SpotifyClient

  def initialize

  end

  def self.for(user)
    # eval is evil
    RSpotify::User.new(eval(user.rspotify_hash))
  end

  def new_playlist(name)
    spotify_playlist = self.create_playlist!(name)
    Playlist.create_from_spotify(spotify_playlist)
  end
end
