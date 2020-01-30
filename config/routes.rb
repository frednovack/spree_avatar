Spree::Core::Engine.add_routes do

  resources :users, only: [:edit, :update], :path => 'account'

  resources :users, :only => [], :path => 'account' do
	  get :edit_avatar
  	put :update_avatar
    delete :delete_avatar
	  resources :avatar_ikon, only: [:edit, :update]
  end

end