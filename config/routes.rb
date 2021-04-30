Rails.application.routes.draw do

  # Root Paths

  authenticated :user do
    root to: 'books#index', as: 'authenticated_root'
  end

  root to: 'pages#home'

  # Users

  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  resources :users, only: [ :show, :edit, :update, :index ]

  get 'commitment', to: 'users#commitment'
  patch 'create_commitment', to: 'users#create_commitment'

  # Book, Lesson and Lesson Validation

  resources :books, only: [ :index, :show ]

  resources :lessons, only: [ :show ] do
    resources :lesson_validations, only: [ :create, :update ]
  end

  # Recipes, User Recipes and User Skills

  resources :lesson_validations, only: [ :show ]
  resources :recipes, only: [ :show ]
  resources :user_recipes, only: [ :index, :edit, :update ]
  resources :user_skills, only: [ :create ]
  resources :grocery_list_items, only: [ :create, :destroy ]
  resources :grocery_lists, only: [ :show, :destroy ]

  # Static Pages

  get '/community', to: "pages#community"
  get '/credits', to: "pages#credits"

  # Admin, Sidekiq and Blazer

  ActiveAdmin.routes(self)

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    mount Blazer::Engine, at: "blazer"
  end
end
