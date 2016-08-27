Rails.application.routes.draw do
  resources :flows, only: [:index, :show]
  root to: 'flows#index'
end
