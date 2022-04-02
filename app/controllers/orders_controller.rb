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

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "Order successfully updated"
      redirect_to order_url(@order)
    else
      flash.now[:error] = "Order update failed"
      render :edit
    end
  end

  def new
    @order = Order.new
    @lechon = Lechon.new
    @lechonoptions = LechonOption.all
    @suppliers = Supplier.all
    @customers = Customer.all.order('last_name')
  end

  def create
    create_order
  end

  def order_params
    params.require(:order).permit(:confirmed_at, :pickup_at, :completed_at, :status, :payment_status, :payment_type, :payment_holder, :payment_received, :notes)
  end

  def empty_cart!
    update_cart({})
  end

  def create_order
    @order = Order.new(
      customer_id: params[:customer_id],
      pickup_at: params[:order][:pickup_at],
      notes: params[:order][:notes]
    )
    if @order.save
      # add delivery
      if params[:delivery] == "true"
        @delivery = Delivery.create(order_id: @order.id)
      end

      # add lechon
      enhanced_cart.each do |entry|
        puts entry
        puts entry[:product][:size]
        entry[:quantity].times {
          @order.lechons.create(
            size: entry[:product][:size],
            base_price: entry[:product][:base_price],
            sell_price: entry[:product][:sell_price]
          )
        }
      end

      flash[:notice] = 'Account registered!'
      empty_cart!
      redirect_to '/orders'
    else
      flash[:notice] = 'Failed'
      redirect_to '/orders'
    end
  end
end