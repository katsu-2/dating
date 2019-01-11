Rails.application.routes.draw do
  devise_for :users
  get 'comments/new'
  resources :users, only: [:index, :show]
  resources :home, only: [:about, :contact]
  root 'posts#index'
  resources :posts do
    resources :comments
  end
end
