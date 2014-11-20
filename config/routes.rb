Rails.application.routes.draw do
  resources :users, except: :index
  resources :feels, only: [:index, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'signin'  => 'sessions#new'
  get 'signout' => 'sessions#destroy'
  root 'pages#welcome'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
