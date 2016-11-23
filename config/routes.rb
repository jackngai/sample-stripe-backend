Rails.application.routes.draw do
  get 'users', to: "users#index"

  post 'users', to: "users#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
