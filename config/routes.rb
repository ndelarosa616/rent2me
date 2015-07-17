Rails.application.routes.draw do
  devise_for :users
  resources :properties

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end