Rails.application.routes.draw do

  get 'users', to: 'users#index'
  post 'register', to: 'users#register'
  post 'login', to: 'users#login'

  post 'add-restaurant', to: 'restaurant#create'

end
