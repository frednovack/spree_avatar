Spree::Core::Engine.add_routes do

  resources :users, only: [], :path => 'account' do
	  resource :avatar, only: [:new, :edit, :update, :destroy]
  end

  namespace :admin, path: Spree.admin_path do
    resources :users, only: [] do
      resource :avatar, only: :destroy
    end
  end

end