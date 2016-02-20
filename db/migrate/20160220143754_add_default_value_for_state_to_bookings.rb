class AddDefaultValueForStateToBookings < ActiveRecord::Migration
  def change
    change_column :bookings, :state, :integer, default: 0
  end
end
