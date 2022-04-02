class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
  end
  
  def show
    @delivery = Delivery.find_by(order_id: params[:id])
  end

  def new
    @delivery = Delivery.new
  end

  def create
    puts "Params --------------> #{params}"
    @delivery = Delivery.new(order_id: params[:id])

    if @delivery.save
      redirect_to '/orders'
    else
      render '/orders'
    end
  end

  def destroy
    @delivery = Delivery.find_by(order_id: params[:order_id])
    @delivery.destroy

    redirect_to '/orders', status: :see_other
  end
end
