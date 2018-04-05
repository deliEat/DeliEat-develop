Rails.application.routes.draw do
  post 'login', to: 'account_service#login'
  post 'register-owner', to: 'account_service#register_owner'
  post 'register-customer', to: 'account_service#register_customer'

  post 'add-restaurants', to: 'restaurants#create'
end
