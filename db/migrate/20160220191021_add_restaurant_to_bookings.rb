class AddRestaurantToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :restaurant, index: true, foreign_key: true
  end
end
