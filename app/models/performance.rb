class Performance < ActiveRecord::Base
  belongs_to :artist
  belongs_to :festival_day
end
