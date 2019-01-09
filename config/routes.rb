Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  devise_for :users
  resources :home, only: [:about, :contact]
  root 'posts#index'
  resources :posts do
    resources :comments
  end
end
