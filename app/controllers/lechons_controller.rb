class LechonsController < ApplicationController
  def index
    @lechons = Lechon.all
  end
end
