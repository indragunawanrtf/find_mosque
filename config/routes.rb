class ActionDispatch::Routing::Mapper
  def draw(route)
    instance_eval(File.read(Rails.root.join("./config/routes/#{ route }.rb")))
  end
end

Rails.application.routes.draw do


  devise_for :users, path: "/"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/viewalldata', to: 'home#home'
  get '/viewalldata/masjid', to: 'home#masjid'
  get '/viewalldata/provinsi', to: 'home#provinsi'
  get '/viewalldata/kajian', to: 'home#kajian'
  get '/viewalldata/ustadz', to: 'home#ustadz'

  root 'home#index'
  resources :users

  draw :backend
  draw :api
end
