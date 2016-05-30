class RessourcePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user_is_organiser?
  end

  def update?
    user_is_organiser?
  end

  def destroy?
    user_is_organiser?
  end

  private

  def user_is_organiser?
    user.organiser
  end

end
