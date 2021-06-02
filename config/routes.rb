Rails.application.routes.draw do

  # Root Paths

  authenticated :user do
    root to: 'books#index', as: 'authenticated_root'
  end

  root to: 'pages#home'

  # Users

  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations', sessions: 'sessions' }

  resources :users, only: [ :show, :edit, :update, :index ] do
    member do
      post :follow
      post :unfollow
      get 'profile', to: 'users#profile'
    end
  end

  get 'commitment', to: 'users#commitment'
  patch 'create_commitment', to: 'users#create_commitment'
  patch 'update_currency', to: 'users#update_currency'

  # Book, Lesson and Lesson Validation

  resources :books, only: [ :index, :show ]

  resources :lessons, only: [ :show ] do
    resources :lesson_validations, only: [ :create ]
  end

  # Recipes, User Recipes and User Skills

  resources :lesson_validations, only: [ :show ]
  resources :recipes, only: [ :show ]
  resources :user_recipes, only: [ :update ] do
    member do
      patch 'archive', to: 'user_recipes#archive'
      put 'archive', to: 'user_recipes#archive'
    end
  end
  get 'feed', to: 'user_recipes#feed'
  resources :user_skills, only: [ :create, :index ]
  resources :grocery_list_items, only: [ :create, :destroy ]
  resources :grocery_lists, only: [ :show, :update, :destroy ]
  resources :quiz_results, only: [ :create ]

  get 'completed_recipes', to: 'user_recipes#completed_recipes'
  get 'unlocked_recipes', to: 'user_recipes#unlocked_recipes'

  resources :feedbacks, only: [ :create ]

  # Static Pages

  get '/community', to: "pages#community"
  get '/credits', to: "pages#credits"
  get '/privacy', to: "pages#privacy"
  # get '/playground', to: "pages#playground"

  # Admin, Sidekiq and Blazer

  ActiveAdmin.routes(self)

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    mount Blazer::Engine, at: "blazer"
  end
end
