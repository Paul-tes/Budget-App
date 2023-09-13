Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  devise_scope :user do
    authenticated :user do
      root :to => 'categories#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'splash_screen#index', as: :unauthenticated_root
    end
  end
  resources :users
  resources :categories do
    resources :purchases
  end
end
