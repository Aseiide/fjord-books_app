Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :books
  root to: "books#index"
  resources :users, only: [:show, :index]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
