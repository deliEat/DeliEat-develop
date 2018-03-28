Rails.application.routes.draw do

  get 'users', to: 'users#index'
  post 'register', to: 'users#register'
  post 'login', to: 'users#login'

  post 'customer_register', to: 'customers#register'
  post 'owner_register', to: 'owners#register'

  post 'add-restaurants', to: 'restaurants#create'

end
