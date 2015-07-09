class MessagecontactPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.validated
    end
  end

  def create?
    true
  end
end
