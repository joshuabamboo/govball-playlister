require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do

  provider :spotify, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], scope: 'playlist-read-private playlist-read-collaborative playlist-modify-public user-read-email playlist-modify-private user-library-read user-library-modify user-follow-modify user-follow-read user-read-private user-read-birthdate'
end
