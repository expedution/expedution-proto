
class InvitationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    is_user_expedition_organiser?
  end

  def show?
    true
  end

  def invite?
    is_user_expedition_organiser?
  end

  def update?
    is_user_expedition_organiser?
  end

  def destroy?
    is_user_expedition_organiser?
  end

  private

  def is_user_expedition_organiser?
    record.expedition.user == user
  end

end
