Rails.application.routes.draw do
  resources :users do
    get :updated_info, on: :member
  end
  root to: 'home#index'
  get '/client_auth' => 'clients#index', as: :clients
  get 'clients/refresh_token' => 'clients#refresh_token'
  get 'clients/external_header' => "clients#external_header"


  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get '/auth/failure' => 'sessions#failure'

end
