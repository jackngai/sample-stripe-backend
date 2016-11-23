Rails.application.routes.draw do
  get 'users', to: "users#index"

  post 'users', to: "users#new"
  get 'users/:id/customer', to: "users#customer"
  post 'users/:id/customer/sources', to: "users#customer_sources"
  post 'users/:id/customer/default_source', to: "users#customer_default_source"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
