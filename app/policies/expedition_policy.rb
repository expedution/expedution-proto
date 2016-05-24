class ExpeditionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
