class UserPolicy < ApplicationPolicy

  def new?
    user_is_admin?
  end

  def create?
    new?
  end

  def destroy?
    new?
  end

  def update?
    (user == record) || user_is_admin?
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_admin?
    user.has_role? :admin
  end
end
