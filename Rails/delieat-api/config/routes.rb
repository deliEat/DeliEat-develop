Rails.application.routes.draw do
  post 'login', to: 'account_service#login'
  post 'register-owner', to: 'account_service#register_owner'
  post 'register-customer', to: 'account_service#register_customer'

  get 'restaurants/all', to: 'restaurant_service#index'
  get 'restaurants/owner/:owner_id', to: 'restaurant_service#of_owner'
  post 'add-restaurants', to: 'restaurant_service#create'
end
