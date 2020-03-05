module Spree
  module Admin
    class AvatarsController < Spree::Admin::BaseController
      before_action :load_user

      def destroy
        if @user.avatar.purge
          flash[:success] = Spree.t(:avatar_deleted)
        end
        redirect_back(fallback_location: spree.admin_path)
      end

      private

      def load_user
        @user = Spree.user_class.find_by_id(params[:user_id])
        unless @user
          flash[:error] = Spree.t(:user_not_found)
          redirect_to admin_path
        end
      end

    end
  end
end