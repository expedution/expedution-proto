class FeedbackPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.user.participant_expeditions.include?(record.activity.day.expedition)
  end

  def destroy?
    record.user == user || user_is_expedition_owner?
  end

  private

  def user_is_expedition_owner?
    record.activity.day.expedition.user == user
  end
end
