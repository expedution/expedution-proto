
class ExpeditionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.organiser
  end

  def show?
    true
  end

end
