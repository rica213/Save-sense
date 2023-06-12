Rails.application.routes.draw do
  devise_for :users

  root "users#splash"

  resources :categories, only: [:index, :new]
  get '/splash', to: 'users#splash'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
