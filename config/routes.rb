Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :statuses
  resources :troubles
  resources :categories
  resources :tasks, except: :show
  resources :secrets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
