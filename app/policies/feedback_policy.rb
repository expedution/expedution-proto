class FeedbackPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.user.participant_expeditions.include?(record.activity.day.expedition)
  end

end
