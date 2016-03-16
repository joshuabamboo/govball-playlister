class Playlist < ActiveRecord::Base
  belongs_to :user

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
