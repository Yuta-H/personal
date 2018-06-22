Rails.application.routes.draw do
  devise_for :users, controllers: {
      confirmations: 'users/confirmations',
      passwords:     'users/passwords',
      registrations: 'users/registrations',
      sessions:      'users/sessions',
  }
  resources :statuses
  resources :troubles
  resources :categories
  resources :tasks
  resources :secrets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
