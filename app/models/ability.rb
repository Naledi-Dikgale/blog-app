class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :create, [Comment, Post]
    if user.role == 'admin'
      can :manage, :all
    else
      can :destroy, Comment, author: user
      can :destroy, Post, author: user
    end
  end
end
