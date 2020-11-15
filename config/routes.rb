Rails.application.routes.draw do
  get 'user/new'
  get 'sessions/new'
  get 'signup', to: 'usersd#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  
  devise_for :users
  root controller: :articles, action: :index
  resources :articles, only: [:show, :new, :create, :edit, :update]
  resources :users
  resources :sessions
end
