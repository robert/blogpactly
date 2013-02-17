class Ability
  include CanCan::Ability

  def initialize user
    can :manage, RssFeed, user_id: user.id
  end

end
