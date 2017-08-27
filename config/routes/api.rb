namespace :api, defaults: { format: :json } do

  scope module: :v1, path: 'v1' do
	  resources :mesjids, :only => [:index, :show]
  end

end