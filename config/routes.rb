Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#home'

  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users', to:'users#index', as: 'users'
  # post '/users', to:'users#index', as: 'users'
  resources :users, only: [:new, :show, :create, :edit, :update]
  resources :attractions
  resources :rides


  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

end
