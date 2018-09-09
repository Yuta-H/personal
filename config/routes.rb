Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :statuses
  resources :troubles
  resources :categories, except: :index
  get '/delete_category_select', to: 'categories#delete_category_select', as: 'delete_category_select'
  resources :tasks, except: :show
  resources :secrets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
