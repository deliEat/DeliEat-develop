class RestaurantsController < ApplicationController
    # disable CSRF until a token authentication is implemented
    skip_before_action :verify_authenticity_token

    def index
        @restaurants = Restaurant.all

        render :json => @restaurants
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.save
        render :json => @restaurant
    end

    private
        def restaurant_params
            params.require(:restaurant).permit(:owner_id, :name, :estimated_cook_time, :campus)
        end
end
