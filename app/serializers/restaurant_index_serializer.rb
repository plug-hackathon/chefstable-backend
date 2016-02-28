class RestaurantIndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :time_zone, :primary_color, :secondary_color
end
