class Booking < ActiveRecord::Base
  enum state: %w( pending accepted rejected cancelled )
  validates :state, inclusion: { in: states.keys }
end
