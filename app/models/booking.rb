class Booking < ActiveRecord::Base
  EMAIL_FORMAT = %r(\A\S+@\S+\z)
  enum state: %w( pending accepted rejected cancelled )
  around_update :state_changed

  belongs_to :restaurant

  validates :state, inclusion: { in: states.keys }
  validates :restaurant_id, presence: true
  validates :number_of_persons, presence: true
  validates :phone_number, presence: true
  validates :starts_at, presence: true
  validates :email, format: { with: EMAIL_FORMAT }, allow_nil: true

  def state_changed
    state_changed = state_changed?
    yield 
    if state_changed
      date = starts_at.strftime("%Y-%m-%d")
      time = starts_at.strftime("%H:%M")
      message = I18n.t(state, date: date, time: time, restaurant_name: self.restaurant.name, scope: %i(bookings status_changed_messages))
      booking = BookingNotification.new
      booking.message = message
      #booking.sms(phone_number)
      booking.send_mail(email)
    end 
  end
end
