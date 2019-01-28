Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :users
  root 'home#top'
  # root 'posts#index'
  resources :posts do
    resources :comments
  end
end
