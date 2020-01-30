module Spree
  class AvatarIkonController < Spree::StoreController

    before_action :load_object, on: [:edit, :update]
    respond_to :js

    def edit
    end

  	def update
  	end

  	private

	  def user_params
  	  params.require(:user).permit(:is_ikon)
  	end

  	def load_object
    	@user ||= spree_current_user
    	authorize! params[:action].to_sym, @user
  	end
	end
end