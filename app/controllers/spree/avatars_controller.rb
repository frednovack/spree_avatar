module Spree
  class AvatarsController < Spree::StoreController

    before_action :load_object, on: [:update, :delete]

    def update
      if @user.update(avatar_params)
        flash[:success] = Spree.t(:account_updated)
      elsif @user.errors[:avatar]
        flash[:error] = @user.errors[:avatar].join(". ")
      else
        flash[:error] = Spree.t(:user_avatar_error)
      end
      redirect_to spree.account_url
    end

    def destroy
      @user.avatar.purge
      redirect_to spree.account_url
    end

    private

    def avatar_params
      params.require(:user).permit(:avatar)
    end

    def load_object
      @user ||= spree_current_user
      authorize! params[:action].to_sym, @user
    end

  end
end