class UsersController < ApplicationController
    # disable CSRF until a token authentication is implemented
    skip_before_action :verify_authenticity_token

    def index
        @users = User.all
        render :json => @users
    end

end
