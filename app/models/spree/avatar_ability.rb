module Spree
  class AvatarAbility
    include CanCan::Ability

    def initialize(user)
      user ||= Spree.user_class.new    	
	  	can :avatar, Spree.user_class, id: user.id
		end

  end
end