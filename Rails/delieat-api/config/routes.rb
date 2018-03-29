Rails.application.routes.draw do

  get 'users', to: 'users#index'
  post 'register-user', to: 'users#register'
  post 'login', to: 'users#login'

  post 'register-customer', to: 'customers#register'
  
  post 'register-owner', to: 'owners#register'

  post 'add-restaurants', to: 'restaurants#create'

end
