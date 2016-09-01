Rails.application.routes.draw do
  devise_for :users
  resources :flows, only: [:index, :show]
  root to: 'flows#index'
end
