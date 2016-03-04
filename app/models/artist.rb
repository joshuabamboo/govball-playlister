class Artist < ActiveRecord::Base
  has_many :performances
  has_many :festival_days, through: :performances
end
