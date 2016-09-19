Rails.application.routes.draw do
  devise_for :users
  namespace :flows do
    resources :newsletters, except: [:edit]
    resources :contacts, only: [:index, :create]
  end
  resources :flows, only: [:index, :show]
  root to: 'flows#index'
end
