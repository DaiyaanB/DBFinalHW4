# config/routes.rb Edited to reflect user stories with help of GPT

Rails.application.routes.draw do
  # Home page route
  root 'places#index'

  # Sessions routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Signup route
  get '/signup', to: 'users#new', as: 'signup'
  post '/users', to: 'users#create'

  # Resources
  resources :entries
  resources :places
  # Assuming you have a sessions controller for handling login
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end
