class Ability
  include CanCan::Ability

  def initialize user
    can :manage, RssFeed, user_id: user.id
    can :read, User
    can [:read, :new, :create], Pact
  end

end
