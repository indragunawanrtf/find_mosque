namespace :backend, path: '/', constraints: { subdomain: 'app' } do

  get '/', to: 'home#index'

  resources :mesjids
  resources :provinces

end
