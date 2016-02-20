class BookingSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :number_of_persons, :stars_at, :state
end
