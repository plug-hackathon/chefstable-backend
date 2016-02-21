class BookingSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :number_of_persons, :starts_at, :state, :email, :message
end
