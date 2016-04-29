class Playlist < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  belongs_to :festival

  attr_accessor :user

  def get_custom_tracks(artist_ids, current_user)
    @user = current_user
    # find each artist
    artists = []
    artist_ids.each do |id|
      artists << Artist.find(id)
    end
    # convert_artists_to_rspotify_objects
    spotify_artists = convert_artists_to_rspotify_objects(artists)
    # get_top_tracks
    case artists.size
    when 1..2
      get_top_tracks(spotify_artists, count: 10)
    when 3..4
      get_top_tracks(spotify_artists, count: 5)
    when 5..6
      get_top_tracks(spotify_artists, count: 4)
    when 7..8
      get_top_tracks(spotify_artists, count: 3)
    when 9..15
      get_top_tracks(spotify_artists, count: 2)
    else
      get_top_tracks(spotify_artists)
    end
  end

  def generate_playlist(title, tracks)
    pl = client.create_playlist!(title)
    pl.add_tracks!(tracks)
    pl
  end

  def create_from_spotify(spotify_playlist, user)
    self.update(
      link: spotify_playlist.external_urls['spotify'],
      title: spotify_playlist.name,
      spotify_id: spotify_playlist.id
    )
  end

  def get_top_tracks_for(festival_name, day, current_user)
    @user = current_user
    artists = get_lineup(festival_name)
    unless day == "all"
      artists = filter_artists_by_day(artists, day)
    end

    client
    spotify_artists = convert_artists_to_rspotify_objects(artists)
    get_top_tracks(spotify_artists)
  end

#helpers
  #Festival class
  def get_lineup(festival_name)
    Artist.all.select do |artist_object|
      artist_object.festival_days.first.festival.name == festival_name
    end
  end

  #Festival class
  def filter_artists_by_day(artists, day)
    artists.select {|a| a if a.festival_days.find_by(start_date: day)}
  end

  #SpotifyClient class?
  def convert_artists_to_rspotify_objects(artists)
    spotify_artists = []
    artists.select do |artist|
      client #passing in the current_user to access here doesnt feel right
      spotify_artists << RSpotify::Artist.search(artist.name).first
    end
    spotify_artists
  end

  def get_top_tracks(spotify_artists, count: 1)
    tracks = []
    binding.pry
    spotify_artists.collect do |artist|
      tracks << artist.top_tracks(:US).sample(count)
    end
    tracks.flatten.shuffle!
  end


  private
  def client
    SpotifyClient.for(user)
  end
end
