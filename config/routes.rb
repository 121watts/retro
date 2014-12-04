Rails.application.routes.draw do
  resources :users
  resources :feels, only: [:index, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get '/signout' => 'sessions#destroy'
  root 'pages#welcome'
  get '/how' => 'pages#how'

  mount_griddler

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
end
