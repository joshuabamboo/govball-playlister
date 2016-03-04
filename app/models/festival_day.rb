class FestivalDay < ActiveRecord::Base
  belongs_to :festival
  has_many :performances
  has_many :artists, through: :performances
end
