class DeliverersController < ApplicationController
  def index
    @deliverers = Deliverer.all
  end
  
  def show
    @deliverer = Deliverer.find(params[:id])
  end
  
  def edit
    @deliverer = Deliverer.find(params[:id])
  end

  def new
    @deliverer = Deliverer.new
  end

  def create

  end

  def destroy

  end
end
