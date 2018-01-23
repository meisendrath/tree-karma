Rails.application.routes.draw do
  devise_for :users

  root to: 'service_transactions#index'

  resources :service_transactions, only: [:index, :show]
end
