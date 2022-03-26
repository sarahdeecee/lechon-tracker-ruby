Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "articles#index"
  get "/articles", to: "articles#index"
  get "/customers", to: "customers#index"
  get "/customers/new", to: "customers#new"
  get "/orders", to: "orders#index"
  get "/orders/new", to: "orders#new"
end
