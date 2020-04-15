class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    user.company == true && record.user == user
  end

  def new?
    user.company == true
  end

  def create?
    user.company == true
  end
end
