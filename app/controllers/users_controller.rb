class UsersController < ApplicationController
  def index

  end

  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
  end
end
