Rails.application.routes.draw do
  devise_for :users
  get 'home/about'
  get 'home/contact'
  root 'posts#index'
  resources :posts
end
