class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
   return true
  end

  def rentals?
   return true
  end
end
