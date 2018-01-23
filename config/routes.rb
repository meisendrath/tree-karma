Rails.application.routes.draw do
  devise_for :users
  root to: 'service_transactions#index'
end
