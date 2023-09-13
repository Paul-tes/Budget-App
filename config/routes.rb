Rails.application.routes.draw do
  devise_for :users
  root :to => 'splash_screen#index'
  resources :users
  resources :categories do
    resources :purchases
  end
end
