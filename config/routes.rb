Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root to: 'pages#home'
  resources :users, only: [ :show, :edit, :update ]

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
