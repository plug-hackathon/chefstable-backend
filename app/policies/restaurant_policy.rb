class RestaurantPolicy < ApplicationPolicy
  def permitted_attributes
    base_attributes = %i(name time_zone primary_color secondary_color)
    base_attributes += [users_attributes: %i(email password)] if admin?
    base_attributes
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      if admin?
        scope.all
      else
        scope.where(id: user&.restaurant_id)
      end
    end
  end
end 
