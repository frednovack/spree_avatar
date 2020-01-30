module Spree::UsersControllerDecorator
  def self.prepended(base)
    base.before_action :load_object, on: [:edit_avatar, :update_avatar, :delete_avatar]
  end

  def edit_avatar
  end

  def update_avatar
    if @user.update(user_params)
      flash[:success] = Spree.t(:account_updated)
    elsif @user.errors[:avatar]
      flash[:error] = @user.errors[:avatar].join(". ")
    else
      flash[:error] = Spree.t(:user_avatar_error)
    end
    redirect_to spree.account_url
  end

  def delete_avatar
    @user.avatar.purge
    redirect_to account_url
  end

  private

  def user_params
    params.require(:user).permit(permitted_user_attributes | [:avatar])
  end

  def load_object
    @user ||= spree_current_user
    authorize! params[:action].to_sym, @user
  end

end
Spree::UsersController.prepend(Spree::UsersControllerDecorator)