class Booking < ActiveRecord::Base
  enum state: %w( pending accepted rejected cancelled )

  belongs_to :restaurant

  validates :state, inclusion: { in: states.keys }
  validates :restaurant_id, presence: true
end
