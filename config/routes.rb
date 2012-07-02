require 'resque/server'
Associalize::Application.routes.draw do
  mount Resque::Server, at: '/resque'
  resources :tweets, only: [:index]
  resources :feed_items, only: [:index]
  get "authentications/create"
  match 'current_user/deals', to: 'users#deals'
  match 'current_user/update_location', to: 'users#update_location'
  match 'auth/:provider/callback', to: 'authentications#create'
  match 'login', to: 'sessions#new', as: 'login'
  match 'signin', to: 'sessions#create', as: 'signin'
  match 'logout', to: 'sessions#destroy', as: 'logout'
  match 'signup', to: 'users#new', as: 'signup'
  resources :sessions, only: [:create]
  resources :users, except: [:index, :destroy, :new]
  root to: 'pages#index'
end
