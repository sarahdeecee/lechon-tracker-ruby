class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  def new
    @customers = Customer.all
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to '/customers', notice: 'Account registered!'
    else
      render :new
    end
  end

  private
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone, :email, :note)
  end
end
