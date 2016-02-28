class AddColorsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :primary_color, :string
    add_column :restaurants, :secondary_color, :string
  end
end
