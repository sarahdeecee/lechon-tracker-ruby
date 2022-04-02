class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
  end
  
  def show
    
  end

  def new
  end

  def destroy
    @delivery = Delivery.find_by(order_id: params[:order_id])
    @delivery.destroy

    redirect_to '/orders', status: :see_other
  end
end
