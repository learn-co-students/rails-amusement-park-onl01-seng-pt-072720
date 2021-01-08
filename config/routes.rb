Rails.application.routes.draw do
  root to: 'sessions#home'
  resources :users, only: [:new, :create, :show]
  resources :attractions, only: [:show, :index, :new, :create, :edit]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
