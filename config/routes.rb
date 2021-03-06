Rails.application.routes.draw do
  devise_for :users, controllers: {
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
  }
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  resources :statuses
  get '/delete_status_select', to: 'statuses#delete_status_select', as: 'delete_status_select'
  resources :troubles
  resources :categories, except: :index
  get '/delete_category_select', to: 'categories#delete_category_select', as: 'delete_category_select'
  resources :tasks, except: :show
  delete '/delete_tasks', to: 'tasks#delete_tasks', as: 'delete_tasks'
  resources :secrets

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
