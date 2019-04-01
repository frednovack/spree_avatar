Spree::Account::UsersController.class_eval do

  respond_to :html

  def avatar
    if request.put?
      if @user.update_attributes(user_params)
        flash.now[:success] = Spree.t(:account_updated)
      end
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(permitted_user_attributes | [:avatar])
  end

end
