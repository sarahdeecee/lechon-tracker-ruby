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
    @suppliers = Supplier.all
    @customers = Customer.all
  end

  def create
    @order = Order.new

    if @order.save
      redirect_to @order
    else
      render :new
    end
  end
end
