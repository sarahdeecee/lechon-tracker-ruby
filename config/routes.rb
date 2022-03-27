Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "articles#index"
  get "/articles", to: "articles#index"
  get "/customers", to: "customers#index"
  get "/customers/new", to: "customers#new"

  post '/customers' => 'customers#create'
  get "/customers/:id", to: "customers#show"
  get "/customers/:id/edit", to: "customers#edit", as: "edit_customer"
  get "/orders", to: "orders#index"
  get "/orders/new", to: "orders#new"
  post "/orders/:id/new", to: "orders#new"
  post "/orders/:id/edit", to: "orders#edit"
end
