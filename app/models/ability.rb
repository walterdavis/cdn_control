class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_admin?
      can :manage, :all
    elsif user.is_author?
      can :read, :all
      can :manage, Library, :user => user
      can :manage, User, :id => user.id
      cannot :set_role, User
    else
      can :read, :all
      can :manage, User, :id => user.id
      cannot :set_role, User
    end
  end
end
