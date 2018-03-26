class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def register
    @customer = Customer.new(customer_params)
    @customer.save
    render :json => @customer
  end

  def retrieve_customer_by_email
    @customer = Customer.find_by email: params[:email]
    render :json => @customer
  end

  private
  def customer_params
    params.require(:customer).permit(:full_name, :phone_number, :email, :user_id)
  end

end
