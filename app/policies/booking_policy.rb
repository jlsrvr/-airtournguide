class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where({ user: [record.tour.user, record.user] })
      # record.tour.user == user (guide --> création du Tour)
      # record.user == user (voyageur --> book Tour)
    end
  end
  def destroy?
    if record.tour.user == user || record.user == user
      true
    end
  end

  def create?
    true
  end
end
