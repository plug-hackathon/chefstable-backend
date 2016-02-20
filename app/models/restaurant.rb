class Restaurant < ActiveRecord::Base
  has_many :users
  has_many :bookings
  has_many :restricted_hours
  has_many :opening_hours

  accepts_nested_attributes_for :users
end
