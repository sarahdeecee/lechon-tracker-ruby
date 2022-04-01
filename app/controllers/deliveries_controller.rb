class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
  end
  
  def show
    
  end

  def new
  end
end
