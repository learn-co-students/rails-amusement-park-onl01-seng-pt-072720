Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users
  resources :attractions
  resources :rides
  resources :sessions, only: [:new, :create]
  get '/signin', to: 'sessions#new'
  get 'signout', to: 'sessions#destroy'
end
