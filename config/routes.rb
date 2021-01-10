Rails.application.routes.draw do
    root 'application#home'
    resources :users
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
end