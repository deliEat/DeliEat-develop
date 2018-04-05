class AccountServiceController < ApplicationController
    # disable CSRF until a token authentication is implemented
    skip_before_action :verify_authenticity_token

    def register_owner
        @user = User.new(user_params)
        @user.save

        @owner = Owner.new(owner_params)
        @owner.user_id = @user.id
        @owner.save

        render :json => @owner
    end

    def register_customer
        @user = User.new(user_params)
        @user.save

        @customer = Customer.new(customer_params)
        @customer.user_id = @user.id
        @customer.save
        
        render :json => @customer
    end

    def login
        @user = User.find_by(username: params[:username], password: params[:password])
        if @user.user_type == 'customer'
            @customer = Customer.find_by(user_id: @user.id)
            response = {
                'user_type' => 'customer',
                'customer' => @customer
            }
            render :json => response
        elsif @user.user_type == "owner"
            @owner = Owner.find_by(user_id: @user.id)
            response = {
                'user_type' => 'owner',
                'owner' => @owner
            }
            render :json => response
        else
            render plain: 'false'
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :password, :user_type)
        end

        def owner_params
            params.require(:owner).permit(:full_name, :phone_number, :email)
        end

        def customer_params
            params.require(:customer).permit(:full_name, :phone_number, :email)
        end
end
