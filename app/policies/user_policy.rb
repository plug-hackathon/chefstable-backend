class UserPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    admin?
  end

  def create?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end

  def permitted_attributes
    if admin?
      %i(email password restaurant_id)
    else
      %i(email password)
    end
  end

  class Scope < Scope
    def resolve
      if admin?
        scope.all
      end
    end
  end
end
