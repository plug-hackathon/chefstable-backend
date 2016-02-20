class CreateRestrictedHours < ActiveRecord::Migration
  def change
    create_table :restricted_hours do |t|
      t.datetime :from_datetime
      t.datetime :to_datetime
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
