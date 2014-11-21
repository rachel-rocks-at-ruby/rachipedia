Rails.application.routes.draw do
  
  resources :wikis

  devise_for :users
      resources :users, only: [:update]

  root to: 'welcome#index'
end
