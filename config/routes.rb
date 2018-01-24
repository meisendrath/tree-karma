Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  as :user do
    get 'become_partner' => 'users#become_partner'
    post 'make_partner' => 'users#make_partner'
  end

  resources :contributions, only: [:index, :create, :new]

  namespace :partner do
    resources :contributions, only: :index do
      post :accept, on: :member
      resources :planted_trees, only: [:new, :create]
    end
  end

  post 'tierion_callbacks/receipt_ready' => 'tierion_callbacks#receipt_ready', defaults: { format: :json }
end
