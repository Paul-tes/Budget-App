Rails.application.routes.draw do
  resources :users
  resources :categories do
    resources :purchases
  end
end
