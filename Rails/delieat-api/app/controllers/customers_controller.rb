class CustomersController < ApplicationController
    # disable CSRF until a token authentication is implemented
    skip_before_action :verify_authenticity_token

    def retrieve_customer_by_email
        @customer = Customer.find_by email: params[:email]
        render :json => @customer
    end

end
