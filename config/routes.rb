Rails.application.routes.draw do
  devise_for :users
  resources :properties

  get 'about' => 'welcome#about'

  authenticated :user do
    root to: 'properties#index', as: :authenticated_root, via: :get
  end

  unauthenticated do
    root to: 'welcome#index'
  end
end