class RestaurantSerializer < RestaurantIndexSerializer
  has_many :opening_hours
  has_many :restricted_hours
end
