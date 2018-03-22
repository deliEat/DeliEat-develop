class MenuController < ApplicationController

  def create
    @menu = Menu.new(create_params)

    @menu.save
  end

  def add_menu_item

  end

  def show_menu_items
    @menu = Menu.find(params[:id])
    render :json => @menu.menu_items
  end

  private
  def create_params
    params.require(:menu).permit(:food_type, :restaurant_id)
  end
end
