class AddEmailAndMessageToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :email, :string
    add_column :bookings, :message, :text
  end
end
