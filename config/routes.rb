Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  # User - Devise & Personal
  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [ :show, :edit, :update ]

  # Pages
  root to: 'pages#home'
  get '/community', to: "pages#community"
  get '/credits', to: "pages#credits"

  # Journey, Book, Lesson and Lesson Validation
  resources :books, only: [ :show ]
  resources :lessons, only: [ :show ] do
    resources :lesson_validations, only: [ :create ]
  end

  # get '/lesson', to: "pages#lesson" # this will be show on lesson controller
  # get '/lessons', to: "pages#lessons" # this will be index on lesson controller

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
