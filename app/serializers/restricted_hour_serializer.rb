class RestrictedHourSerializer < ActiveModel::Serializer
  attributes :id, :from_datetime, :to_datetime, :restaurant_id
end
