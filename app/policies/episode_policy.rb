class EpisodePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    user.admin == true
  end

  def create?
    user.admin == true
  end

  def edit?
    user.admin == true
  end

  def detroy?
    user.admin == true
  end

end
