class AddRestaurantToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :restaurant, index: true, foreign_key: true
  end
end
