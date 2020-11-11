class CraftPolicy < ApplicationPolicy
  def create?
    return true
  end

  def show?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
