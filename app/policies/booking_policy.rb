class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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
