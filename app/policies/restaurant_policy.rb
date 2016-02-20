class RestaurantPolicy < ApplicationPolicy
  def permitted_attributes
    base_attributes = %i(name time_zone)
    base_attributes + [users_attributes: %i(email password)] if admin?
    base_attributes
  end

  class Scope
    def resolve
      if admin?
      	scope.all
      else
      	scope.where(id: user&.restaurant_id)
      end
    end
  end
end 
