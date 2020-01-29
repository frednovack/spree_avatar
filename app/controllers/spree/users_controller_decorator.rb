module Spree::UsersControllerDecorator
  def self.prepended(base)
    base.before_action :load_object, on: [:picture, :delete_picture]
  end

  def picture
    if request.put?
      if @user.update(user_params)
        flash[:success] = Spree.t(:account_updated)
      else
        flash[:error] = Spree.t(:user_picture_error)
      end
      redirect_to account_url
    end
  end

  def delete_picture
    @user.picture.purge
    redirect_to account_url
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