class CreateOpeningHours < ActiveRecord::Migration
  def change
    create_table :opening_hours do |t|
      t.integer :week_day
      t.string :from_time
      t.string :to_time
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
