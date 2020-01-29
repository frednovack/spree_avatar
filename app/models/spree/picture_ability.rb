module Spree
  class PictureAbility
    include CanCan::Ability

    def initialize(user)
      user ||= Spree.user_class.new    	
	  	can :picture, Spree.user_class, id: user.id
		end

  end
end