Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :contributions, only: [:index, :show, :create, :new]

  resources :users, only: :show
end
