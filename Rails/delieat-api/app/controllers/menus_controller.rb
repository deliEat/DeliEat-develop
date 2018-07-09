class MenusController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @menu = Menu.new(create_params)

    @menu_items = params[:menu][:menu_items]
    @restaurant_id = params[:menu][:restaurant_id]
    @restaurant = Restaurant.find(@restaurant_id)

    if @restaurant
      @menu.restaurant = @restaurant
    else
      render :json => {error: "Restaurant for the menu does not exist"}, :status => :bad_request
    end

    @menu_items.each do |menu_item|
      create_menu_item(menu_item, @menu)
    end

    if @menu.save
      render :json => @menu
    else
      render :json => {error: "Unable to save menu"}, :status => :bad_request
    end
  end

  def update
    @menu = Menu.find(params[:menu_id])

    if @menu
      @menu.name = params[:name]

      @menu.save
    end
  end

  def add_menu_item

  end

  def show_menu
    @menu = Menu.find(params[:menu_id])
    render :json => @menu
  end

  def show_menu_items
    @menu = Menu.find(params[:menu_id])
    render :json => @menu.menu_items
  end

  private
  def create_params
    params.require(:menu).permit(:food_type, :restaurant_id, :menu_items)
  end

  def create_menu_item(menu_item_json, menu)
    if menu_item_json[:menu_item]
      @menu_item = MenuItem.new(menu_item_json.require(:menu_item).permit(:name, :price, :description))
      @menu_item.menu = menu
      @menu_item.save
    else
      render :json => {error: "No menu item is being passed in Menus_controller"}, :status => :bad_request
    end
  end
end
