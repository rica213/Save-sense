# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here.
    user ||= User.new 

    # Logged in user can manage all trades and categories that belongs to them
    can :manage, Trade, user_id: user.id
    can :manage, Category, user_id: user.id
  
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
