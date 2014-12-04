Rails.application.routes.draw do
  resources :users
  resources :feels, only: [:index, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get '/how' => 'pages#how'
  get 'signin'  => 'sessions#new'
  get 'signout' => 'sessions#destroy'
  root 'pages#welcome'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
