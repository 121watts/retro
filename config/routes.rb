Rails.application.routes.draw do
  root 'users#new'  
  resources :users, only: [:new, :create]
  resources :retrospectives, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  get 'signin'  => 'sessions#new'
  get 'signout' => 'sessions#destroy'
end
