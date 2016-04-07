class Artist < ActiveRecord::Base
  has_many :performances
  has_many :festival_days, through: :performances

  def get_genres
    self.genres << RSpotify::Artist.search(self).first.genres
  end
end
