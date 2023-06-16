Rails.application.routes.draw do
  devise_for :users

  root "users#splash"

  resources :trades, only: [:index, :show, :new, :create]
  resources :categories, only: [:index, :new, :create, :show] do
    resources :trades, only: [:index]
  end
  get "/splash", to: "users#splash"

  # Catch-all route for handling invalid URLs
  match "*path", to: "application#handle_routing_error", via: :all

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
