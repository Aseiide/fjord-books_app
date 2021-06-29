Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :books
  root to: "books#index"
  resources :users, only: [:show, :index]
end
