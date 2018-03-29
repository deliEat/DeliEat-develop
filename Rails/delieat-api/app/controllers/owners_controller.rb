class OwnersController < ApplicationController
    # disable CSRF until a token authentication is implemented
    skip_before_action :verify_authenticity_token

    def index
        @owners = Owner.all
        render :json => @owners
    end

    def register
        @owner = Owner.new(owner_params)
        @owner.save
        render :json => @owner
    end

    private
    def owner_params
        params.require(:owner).permit(:full_name, :user_id)
    end
end
