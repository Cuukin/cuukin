Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'user/omniauth_callbacks', registrations: "registrations" }

  root to: 'pages#home'
  get '/welcome', to: "pages#welcome"

  namespace :user do
    resources :users, only: [ :show, :edit, :update ]
  end

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
