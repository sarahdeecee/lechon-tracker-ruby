class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(params.require(:customer).permit(:first_name, :last_name, :phone, :email, :note))
      flash[:success] = "Customer successfully updated"
      redirect_to customer_url(@customer)
    else
      flash.now[:error] = "Customer update failed"
      render :edit
    end
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
