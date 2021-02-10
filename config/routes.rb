Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users, only: [ :show, :edit, :update ]

  get '/lesson', to: "pages#lesson" # this will be show on lesson controller
  get '/lessons', to: "pages#lessons" # this will be index on lesson controller

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
