class OwnerController < ApplicationController
        # disable CSRF until a token authentication is implemented
    skip_before_action :verify_authenticity_token

    def index
        @owners = Owner.all
        render :json => @owners
    end

    

end
