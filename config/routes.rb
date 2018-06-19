Rails.application.routes.draw do
  root to: 'users#index'
  resources :statuses
  resources :troubles
  resources :categories
  resources :tasks
  resources :users, only: [:index]
  resources :login_ids
  resources :secrets
  resources :passwords

  get 'login', to: 'users#new'
  post 'login', to: 'users#session_create'
  delete 'logout', to: 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
