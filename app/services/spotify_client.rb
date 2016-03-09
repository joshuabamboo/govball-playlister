class SpotifyClient
  def self.for(user)
    # eval is evil
    RSpotify::User.new(eval(user.rspotify_hash))
  end
end
