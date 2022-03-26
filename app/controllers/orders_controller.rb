class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @lechon = Lechon.new
    @lechonoptions = LechonOption.all
    @suppliers = Supplier.all
    @customers = Customer.all
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def order_params
    params.require(:order).permit(
      :first_name, :last_name, 
      lechons_attributes: [:supplier_id, :order_id, :size, :_destroy])
  end
end
