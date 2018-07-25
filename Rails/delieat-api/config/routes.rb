Rails.application.routes.draw do
  post 'login', to: 'account_service#login'
  post 'register-owner', to: 'account_service#register_owner'
  post 'register-customer', to: 'account_service#register_customer'

  get 'restaurants/all', to: 'restaurant_service#index'
  get 'restaurants/owner/:owner_id', to: 'restaurant_service#of_owner'

  post 'restaurants/owner', to: 'restaurant_service#create'

  post 'menu', to: 'menus#create'
  get  'menu/:restaurant_id', to: 'menu#get_menus_by_restaurant'
  get  'menu/:menu_id', to: 'menus#show_menu'
  get  'menu/:menu_id/menu_item', to: 'menus#show_menu_items'
  post 'menu/:menu_id/menu_item', to: 'menu_items#create'
  put  'menu/:menu_id/menu_item/:menu_item_id', to: 'menu_items#update'
  get  'menu/:menu_id/menu_item/:menu_item_id', to: 'menu_items#show'
end
