Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "articles#index"
  get "/articles", to: "articles#index"

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders
  
  resources :deliveries, param: :order_id

  get "/customers", to: "customers#index", as: "customers"
  get "/customers/new", to: "customers#new"
  post "/customers" => "customers#create"
  get "/customers/:id", to: "customers#show", as: "customer"
  get "/customers/:id/edit", to: "customers#edit", as: "edit_customer"
  delete "/customers/:id", to: "customers#destroy", as: "destroy_customer"
  patch "/customers/:id", to: "customers#update"

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end
end
