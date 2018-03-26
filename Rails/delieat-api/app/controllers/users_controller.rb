class UsersController < ApplicationController
    # disable CSRF until a token authentication is implemented
    skip_before_action :verify_authenticity_token

    def index
        @users = User.all
        render :json => @users
    end

    def register
        @user = User.new(user_params)
        @user.save
        render :json => @user
    end

    def login
        @user = User.find_by(username: params[:username], password: params[:password])

        if @user
            render :json => @user
        else
            render plain: 'false'
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :password, :user_type)
        end
end
