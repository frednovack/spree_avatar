Spree::Account::UsersController.class_eval do

  before_action :load_and_authorize_user, except: [:new, :create]

  respond_to :html

  def avatar
    if request.put?
#      @user.avatar.purge 	
      if @user.avatar.attach(params[:avatar])
        flash.now[:success] = Spree.t(:account_updated)
      end
      render :show
    end
  end

  private

  def load_and_authorize_user
    @user ||= spree_current_user
    authorize! params[:action].to_sym, @user
  end

end
