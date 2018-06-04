Rails.application.routes.draw do
  root to: 'users#index'
  resources :statuses
  resources :troubles
  resources :categories
  resources :tasks
  resources :users
  resources :login_ids
  resources :secrets
  resources :passwords
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
