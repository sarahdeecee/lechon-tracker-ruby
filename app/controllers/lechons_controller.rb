class LechonsController < ApplicationController
  def index
    @lechons = Lechon.all
  end

  def show
    @lechon = Lechon.find(params[:id])
  end

  def destroy
    @lechon = Lechon.find(params[:id])
    @lechon.destroy

    redirect_to '/lechons', status: :see_other
  end
end
