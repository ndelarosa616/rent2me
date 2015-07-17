Rails.application.routes.draw do
  resources :properties

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end