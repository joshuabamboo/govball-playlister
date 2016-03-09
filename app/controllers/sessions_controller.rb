class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.from_oauth(auth)
    session[:user_id] = user.id
    binding.pry

    spotify_user = RSpotify::User.new(auth)

    redirect_to root_url, notice: "Signed in"
  end

  def delete
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end


# # Plan A
# client = SpotifyClient.for(user)
#
# class SpotifyClient
#   def self.for(user)
#     RShittyGem.new(user.rspotify_hash)
#   end
#
# end
# client.tracks
#
# user.tracks
# user.playlists
#
# # Plan B
# class Account
#   def tracks
#     client.tracks
#   end
#
#   private
#   def client
#     RShittyGem.new(self.rspotify_hash)
#   end
# end
