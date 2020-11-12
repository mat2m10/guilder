class UserPolicy < ApplicationPolicy

  def show?
    true
  end

  def update?
    record == user
  end

  def all?
    record == user
  end

  def client?
    record == user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
