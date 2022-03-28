Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "articles#index"
  get "/articles", to: "articles#index"

  get "/customers", to: "customers#index", as: "customers"
  get "/customers/new", to: "customers#new"
  post "/customers" => "customers#create"
  get "/customers/:id", to: "customers#show", as: "customer"
  get "/customers/:id/edit", to: "customers#edit", as: "edit_customer"
  patch "/customers/:id", to: "customers#update"
  
  get "/orders", to: "orders#index", as: "orders"
  get "/orders/new", to: "orders#new"
  post "/orders" => "orders#create"
  get "/orders/:id", to: "orders#show", as: "order"
  get "/orders/:id/edit", to: "orders#edit", as: "edit_order"
  patch "/orders/:id", to: "orders#update"

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end
end
