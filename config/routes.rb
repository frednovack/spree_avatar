Spree::Core::Engine.routes.draw do

  namespace :account do
    resource :user, :path => '' do
      get :avatar
      put :avatar
    end
  end

end