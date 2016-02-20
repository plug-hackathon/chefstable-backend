class OpeningHour < ActiveRecord::Base
	TIME_FORMAT = %r(\A\d{2}:\d{2}\z)
	enum week_day: %w( monday tuesday wednesday thursday friday saturday sunday )
  
  belongs_to :restaurant

  validates :week_day, inclusion: { in: week_days.keys }
  validates :from_time, format: { with: TIME_FORMAT }
  validates :to_time, format: { with: TIME_FORMAT }
end
