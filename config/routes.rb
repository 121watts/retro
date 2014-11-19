Rails.application.routes.draw do
  root 'users#new'  
  resources :users, only: [:new, :create]
  resources :retrospectives, only: [:index]
end
