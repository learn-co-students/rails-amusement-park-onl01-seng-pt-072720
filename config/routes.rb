Rails.application.routes.draw do
    root 'application#home'
    
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'

    delete '/sessions', to: 'sessions#destroy'
    
    resources :users
    resources :attractions
    resources :rides
end