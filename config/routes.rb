Rails.application.routes.draw do
  root :to => 'splash_screen#index'
  resources :users
  resources :categories
  resources :purchases
  resources :splash_screen
end
