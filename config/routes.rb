Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/create'
  resources :todos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "todos#index"

  get '/register', to: "users#new"
  resources :users, only: [:create]

  get '/sign_in', to: "sessions#new"
  get '/sign_out', to: "sessions#destroy"
  resources :sessions, only: [:create]
end