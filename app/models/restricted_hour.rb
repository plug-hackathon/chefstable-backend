class RestrictedHour < ActiveRecord::Base
  belongs_to :restaurant

  validates :from_datetime, presence: true
  validates :to_datetime, presence: true
end
