Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :service_transactions, only: [:index, :show]

  resources :users, only: :show
end
