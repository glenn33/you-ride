class VehiclePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
   return true
  end

  def create?
   return true
  end
  
  def update?
   record.user == user
  end

  def delete?
   record.user == user
  end

end