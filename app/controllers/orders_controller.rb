class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
    @statuses = ["Pending order", "Ordered", "Completed"]
    @payment_types = ["Cash", "E-transfer", "Other"]
    @payment_received_types = ['Pending', 'Partial', 'Received']
    @payment_holders = Deliverer.pluck(:name).unshift(Order.find(params[:id]).payment_holder)
  end

  def new
    @order = Order.new
    @lechon = Lechon.new
    @lechonoptions = LechonOption.all
    @suppliers = Supplier.all
    @customers = Customer.all.order('last_name')
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
      :first_name, :last_name, :pickup_at
    )
  end
end
