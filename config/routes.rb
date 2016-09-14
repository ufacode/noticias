Rails.application.routes.draw do
  devise_for :users
  namespace :flows do
    resources :newsletters, except: [:edit]
  end
  resources :flows, only: [:index, :show]
  root to: 'flows#index'
end
