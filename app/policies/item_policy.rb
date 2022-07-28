class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # ^^^^^^^ Will be called for index action
      scope.all
      # scope.where(user: user) # <- only user that created restaurant can see it
    end
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def edit?
    # If the user is the own of the item => true; otherwise => false
    ## user => current_user
    ## record => @item (arg passed to authorize)
    user == record.user
  end

  def update?
    edit?
  end

  def destroy?
    record.user == user
    # user_is_owner_or_admin?
  end

  # private

  # def user_is_owner_or_admin?
  #   record.user == user || user.admin
  # end
end
