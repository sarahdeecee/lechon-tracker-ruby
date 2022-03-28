class CartsController < ApplicationController
  def show
  end

  def add_item
    lechon_options_id = params[:lechon_options_id].to_s
    modify_cart_delta(lechon_options_id, +1)

    redirect_back(fallback_location: root_path)
  end

  def remove_item
    lechon_options_id = params[:lechon_options_id].to_s
    modify_cart_delta(lechon_options_id, -1)

    redirect_back(fallback_location: root_path)
  end

  private

  def modify_cart_delta(lechon_options_id, delta)
    cart[lechon_options_id] = (cart[lechon_options_id] || 0) + delta
    cart.delete(lechon_options_id) if cart[lechon_options_id] < 1
    update_cart cart
  end
end
