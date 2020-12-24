class Ability
  include CanCan::Ability

  def initialize(user)
    # for any visitor or user
    can :read, :all

    if user
      if user.admin?
        # admins can do any action on any model or action
        can :manage, :all
      else
        # regular users can read all content
        can :read, :all
      end
    end
  end
end
