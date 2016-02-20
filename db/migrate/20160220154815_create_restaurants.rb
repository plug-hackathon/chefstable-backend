class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :time_zone

      t.timestamps null: false
    end
  end
end
