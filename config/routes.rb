Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  resources :users
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  # get '/users/new' => 'users#new'
  post '/logout' => 'sessions#destroy'
  
  # post '/take_ride' => 'users#ride'


end
