Rails.application.routes.draw do
  root 'sessions#home'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  resources :users
  resources :attractions
  resources :rides
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

