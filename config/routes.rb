Rails.application.routes.draw do 
  # All magic devise controller. 
  devise_for :users
  # Root for authenticated users.
  authenticated :user do
    root :to => 'dashboard#show', as: :authenticated_root
  end
  # Root for non-auth users.
  root :to => 'pages#index'

  # Administrate Admin Dashboards
  namespace :admin do
    resources :users
    root to: "users#index"
  end

  # Derp.
  resources :pages, only: :index
  # Derpp.
  resource :dashboard, controller: 'dashboard', only: :show
  

end
