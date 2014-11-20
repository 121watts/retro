Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :feels, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  get 'signin'  => 'sessions#new'
  get 'signout' => 'sessions#destroy'
  root 'pages#welcome'
end
