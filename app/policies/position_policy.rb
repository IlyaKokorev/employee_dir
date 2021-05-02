class PositionPolicy < ApplicationPolicy
  def create?
    user_is_admin?
  end

  def edit?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
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
