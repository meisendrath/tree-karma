Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  as :user do
    get 'become_partner' => 'users#become_partner'
    post 'make_partner' => 'users#make_partner'
  end

  resources :contributions, only: [:index, :create, :new]

  scope module: 'partner' do
    resources :contributions, only: :index
  end

  namespace :partner do
    constraints subdomain: 'partner' do
      resources :contributions, only: :index
    end
  end
end
