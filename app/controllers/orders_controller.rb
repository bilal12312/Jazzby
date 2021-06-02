class OrdersController < ApplicationController
  def index
  	 @orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def new
  	 @order = Order.new
  end
  def create
	  @order = Order.new(order_params)
	  @current_cart.line_items.each do |item|
	    @order.line_items << item
	    item.cart_id = nil
	  end
	  respond_to do |format|
	      if @order.save
	        # Tell the OrderMailer to send a delivery email after save
	        OrderMailer.deliver_email(@order).deliver

	        format.html 
	        format.json { render json: @order, status: :created, location: @order }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @order.errors, status: :unprocessable_entity }
          end
      end
	  Cart.destroy(session[:cart_id])
	  session[:cart_id] = nil
	  redirect_to root_path
  end

	private
	  def order_params
	    params.require(:order).permit(:name, :email, :address, :pay_method)
	  end
	end

