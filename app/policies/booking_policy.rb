class BookingPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    super || record.restaurant == user&.restaurant
  end

  def permitted_attributes
    base_attributes = [:name, :phone_number, :number_of_persons, :starts_at]

    if user.nil?
      base_attributes
    else
      base_attributes + [:state]
    end
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
