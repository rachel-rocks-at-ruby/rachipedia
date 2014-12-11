Rails.application.routes.draw do
  
  resources :wikis
  resources :collaborations, only: [:new, :create]

  devise_for :users
      resources :users, only: [:update]

  resources :charges, only: [:new, :create]

  root to: 'welcome#index'
end
