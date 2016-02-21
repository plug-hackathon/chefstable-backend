class Booking < ActiveRecord::Base
	EMAIL_FORMAT = %r(\A\S+@\S+\z)
  enum state: %w( pending accepted rejected cancelled )

  belongs_to :restaurant

  validates :state, inclusion: { in: states.keys }
  validates :restaurant_id, presence: true
  validates :number_of_persons, presence: true
  validates :phone_number, presence: true
  validates :starts_at, presence: true
  validates :email, format: { with: EMAIL_FORMAT }

end