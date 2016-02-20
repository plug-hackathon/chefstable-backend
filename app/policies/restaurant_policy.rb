class RestaurantPolicy < ApplicationPolicy

	def index?
		true
	end

	def show?
		true
	end

	def create?
		true
	end

	def update?
		true
	end

	def destroy?
		true
	end

	class Scope < Scope
    def resolve
      scope
    end
  end

end 