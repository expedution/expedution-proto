class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    is_record_current_user? || do_record_and_user_participate_to_the_same_expedition? || does_record_participate_to_an_expe_organized_by_user? || does_user_participate_to_an_expe_organized_by_record?
  end

  def update?
    is_record_current_user? || does_record_participate_to_an_expe_organized_by_user
  end

  private

  # user => current_user
  # record => @user

  def is_record_current_user?
    # si user est le record
    record == user
  end

  def do_record_and_user_participate_to_the_same_expedition?
    # si user et record participent à la meme expedition
    (at_user_expeditions - current_user_expeditions) != at_user_expeditions
  end

  def does_record_participate_to_an_expe_organized_by_user?
    # si user organise et record participe
    (current_user_expe_as_organizer - at_user_expeditions) != current_user_expe_as_organizer
  end

  def does_user_participate_to_an_expe_organized_by_record?
    # si record organise et user participe
    (at_user_expe_as_organizer - current_user_expeditions) != at_user_expe_as_organizer
  end

  def at_user_expeditions
    record.participations.map(&:expedition)
  end

  def current_user_expeditions
    user.participations.map(&:expedition)
  end

  def current_user_expe_as_organizer
    user.expeditions
  end

  def at_user_expe_as_organizer
    record.expeditions
  end
end
