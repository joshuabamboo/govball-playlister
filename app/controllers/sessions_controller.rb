class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.from_oauth(auth)
    session[:user_id] = user.id

    client = SpotifyClient.for(user)

    redirect_to festivals_path, notice: "Signed in"
  end

  def delete
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end
