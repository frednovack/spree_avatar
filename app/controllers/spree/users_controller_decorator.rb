module Spree::UsersControllerDecorator
  def self.prepended(base)
    base.before_action :load_object, on: [:picture]
  end

  def picture
    if request.put?
      if @user.update_attributes(user_params)
        flash[:success] = Spree.t(:account_updated)
      else
        flash[:error] = Spree.t(:user_picture_error)
      end
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(permitted_user_attributes | [:picture])
  end

  def load_object
    @user ||= spree_current_user
    authorize! params[:action].to_sym, @user
  end

end
Spree::UsersController.prepend(Spree::UsersControllerDecorator)