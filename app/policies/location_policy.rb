class LocationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.validated
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    # should be user.admin? when this is defined. True in meantime
    true
  end


  def show?
    true
  end

  def destroy?
    # user.admin
    true
  end

  def show?
    true
  end
end

