class MenuItemsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @menu_item = MenuItem.new(create_params)

    @menu_item.save
  end

  def update
    @menu_item = MenuItem.find(params[:menu_item_id])

    if @menu_item
      @menu_item.name = params[:name]
      @menu_item.price = params[:price]
      @menu_item.description = params[:description]

      @menu_item.save
    end
  end

  def show
    @menu_item = MenuItem.find(params[:menu_item_id])

    render :json => @menu_item
  end

  private
  def create_params
    params.require(:menu_item).permit(:menu_id, :name, :price, :description)
  end
end
