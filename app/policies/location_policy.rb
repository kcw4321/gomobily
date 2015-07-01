class LocationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.validated
    end
  end

  def create?
    true
  end

  def update?
    # should be user.admin? when this is defined. True in meantime
    true
  end
end

