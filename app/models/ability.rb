class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all # permissions for every user, even if not logged in
    return if user.blank?

    can :manage, Post, user_id: user.id
    can :manage, :all if user.admin? # additional permissions for administrators
  end
end
