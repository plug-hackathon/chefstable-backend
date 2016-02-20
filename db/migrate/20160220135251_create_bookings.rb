class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :phone_number
      t.integer :number_of_persons
      t.datetime :starts_at
      t.integer :state

      t.timestamps null: false
    end
  end
end
