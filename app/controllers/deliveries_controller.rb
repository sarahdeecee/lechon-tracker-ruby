class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
  end
  
  def show
    @delivery = Delivery.find_by(order_id: params[:order_id])
  end

  def new
    @order = Order.find(params[:order_id])
    @delivery = Delivery.new
    @deliverers = Deliverer.order(:name)
  end

  def create
    @delivery = Delivery.new(
      order_id: params[:delivery][:order_id],
      deliverer_id: params[:delivery][:deliverer_id],
      location: params[:delivery][:location],
      address: params[:delivery][:address],
      delivery_charge: params[:delivery][:delivery_charge]
    )

    if @delivery.save
      redirect_to order_path(Order.find(@delivery.order_id))
    else
      redirect_to order_path(Order.find(@delivery.order_id))
    end
  end

  def destroy
    @delivery = Delivery.find_by(order_id: params[:order_id])
    @delivery.destroy

    redirect_to '/orders', status: :see_other
  end
end
