Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root to: 'pages#home'

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
