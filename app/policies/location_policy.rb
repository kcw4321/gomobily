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
    user.admin?
  end
end

