Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  # User - Devise & Personal
  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }
  resources :users, only: [ :show, :edit, :update ]

  authenticated :user do
    root to: 'books#index', as: 'authenticated_root'
  end

  # Pages
  root to: 'pages#home'
  get '/community', to: "pages#community"
  get '/credits', to: "pages#credits"
  get '/welcome', to: "pages#welcome"

  # Journey, Book, Lesson and Lesson Validation
  resources :books, only: [ :index, :show ]
  resources :lessons, only: [ :show ] do
    resources :lesson_validations, only: [ :create, :update ]
    resources :lesson_unblocks, only: [ :create ]
  end

  resources :lesson_validations, only: :show

  resources :user_recipes, only: :index
  resources :user_badges, only: :show
  resources :user_awards, only: :show
  resources :badges, only: :show

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    mount Blazer::Engine, at: "blazer"
  end
end
