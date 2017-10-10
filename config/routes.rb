class ActionDispatch::Routing::Mapper
  def draw(route)
    instance_eval(File.read(Rails.root.join("./config/routes/#{ route }.rb")))
  end
end

Rails.application.routes.draw do


  # devise_for :users, path: "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'home#index'
  get 'home', to: 'home#home'


  scope module: 'backend' do
    resources :mesjids
  end

  scope module: 'backend' do
    resources :provinces
  end

  scope module: 'backend' do
    resources :ustads
  end

  scope module: 'backend' do
    resources :kajians
  end

  draw :backend
  draw :api
end
