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
    puts "---------> Order params: #{order_params}"
    @order = Order.new(
      customer_id: params[:customer_id],
      pickup_at: params[:order][:pickup_at],
      notes: params[:order][:notes]
    )
    if @order.save
      if params[:delivery] == "true"
        @delivery = Delivery.create(order_id: @order.id)
      end
      flash[:notice] = 'Account registered!'
      redirect_to '/orders'
    else
      flash[:notice] = 'Failed'
      redirect_to '/orders'
    end

    # if order.valid?
    #   empty_cart!
    #   redirect_to order, notice: 'Your Order has been placed.'
    # else
    #   redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    # end
  end

  def order_params
    params.require(:order).permit(:pickup_at, :notes)
  end

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def create_order
    order = Order.new(
      customer_id: :id,
      confirmed_at: DateTime.now,
      pickup_at: :pickup_at,
      total_price: cart_subtotal_cents,
      notes: :notes,
    )
    puts order
    # delivery

    # lechon_id

    # enhanced_cart.each do |entry|
    #   product = entry[:product]
    #   quantity = entry[:quantity]
    #   order.cart_items.new(
    #     product: product,
    #     quantity: quantity,
    #     item_price: product.price,
    #     total_price: product.price * quantity
    #   )
    # end
    order.save!
    order
  end
end