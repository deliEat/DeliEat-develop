class MenuItemsController < ApplicationController

  def create
    @menu_item = MenuItem.new(create_params)

    @menu_item.save
  end

  def show
    @menu_item = MenuItem.find(params[:id])

    render :json => @menu_item
  end

  private
  def create_params
    params.require(:menu_item).permit(:menu_id, :name, :price, :description)
  end
end
