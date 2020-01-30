Spree::Core::Engine.add_routes do

  resources :users, only: [:edit, :update], :path => 'account'

  resources :users, :only => [], :path => 'account' do
	  get :avatar
  	put :avatar
    delete :delete_avatar
  end

end