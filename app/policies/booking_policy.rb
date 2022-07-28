class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    return true
  end

  def create?
    return true
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end

  # NOTE: Be explicit about which records you allow access to!
  # def resolve
  #   scope.all
  # end
end
