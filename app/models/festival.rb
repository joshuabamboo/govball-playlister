class Festival < ActiveRecord::Base
  belongs_to :organizer
  has_many :festival_days
end
