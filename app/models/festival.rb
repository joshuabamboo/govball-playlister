class Festival < ActiveRecord::Base
  belongs_to :organizer
  has_many :festival_days
  has_many :playlists

  # def get_lineup
  #   lineup = {}
  #
  #   self.festival_days.each do |day|
  #     day_of_week = day.start_date.strftime('%A')
  #     lineup[day_of_week] = day.artists
  #   end
  #
  #   lineup
  # end
  #
  # def get_lineup_by_day(day)
  #   lineup = nil
  #
  #   self.festival_days.each do |festival_day|
  #     day_of_week = festival_day.start_date.strftime('%A')
  #     day.capitalize!
  #     if day_of_week === day || day_of_week.slice(0,3) === day
  #       lineup = festival_day.artists
  #     end
  #   end
  #
  #   lineup
  # end

end
