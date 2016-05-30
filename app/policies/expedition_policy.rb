
class ExpeditionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user_is_organiser?
  end

  def show?
    user_is_owner? || user.participant_expeditions.include?(record)
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_organiser?
    user.organiser
  end

  def user_is_owner?
    user == record.user
  end

end
