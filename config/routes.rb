Rails.application.routes.draw do
  
  # All magic devise controller. 
  devise_for :users
  # Administrate Admin Dashboards
  namespace :admin do
    resources :users
    root to: "users#index"
  end

  resources :pages, only: :index
  resource :dashboard, controller: 'dashboard', only: :show
  authenticated :user do
    root :to => 'dashboard#show', as: :authenticated_root
  end
  root :to => 'pages#index'

end
