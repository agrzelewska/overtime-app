Rails.application.routes.draw do
  namespace :admin do
      resources :posts
      resources :users
      resources :admin_users

      root to: "posts#index"
    end
  resources :posts
  devise_for :users, skip: [:registration]
  root to: 'static#homepage'
end
