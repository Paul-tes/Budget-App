Rails.application.routes.draw do
  root :to => 'splash_screen#index'
  resources :users
  resources :categories do
    resources :purchases
  end
end
