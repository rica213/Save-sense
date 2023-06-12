Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index, :new] 
  
  root "categories#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
