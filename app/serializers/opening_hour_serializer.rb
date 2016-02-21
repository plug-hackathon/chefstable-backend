class OpeningHourSerializer < ActiveModel::Serializer
  attributes :id, :week_day, :from_time, :to_time, :restaurant_id
end
