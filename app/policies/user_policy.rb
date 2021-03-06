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

  class Scope < Scope
    def resolve
      user.clients
    end
  end
end
