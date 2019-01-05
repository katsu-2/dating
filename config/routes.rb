Rails.application.routes.draw do
  get 'home/about'
  get 'home/contact'
  root 'posts#index'
  resources :posts
end
