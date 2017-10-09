namespace :api, defaults: { format: :json } do

  scope module: :v1, path: 'v1' do
    resources :mesjids, :except => [:delete]
  	resources :kajians, :except => [:delete]
    resources :ustads, :except => [:delete]

    post :login, to: 'users#login'
    delete :logout, to: 'users#logout'
    post   :change_password, to: 'users#change_password'
  end

end
