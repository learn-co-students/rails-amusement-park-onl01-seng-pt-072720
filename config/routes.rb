Rails.application.routes.draw do
  root to: 'sessions#home'
  resources :users, only: [:new, :create, :show]
  resources :attractions
  get '/signin', to: 'sessions#new'
  post '/session', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post '/rides', to: 'rides#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
