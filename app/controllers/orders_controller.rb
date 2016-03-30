class OrdersController < ApplicationController
  def index
    if params[:movie_id].present?
      @orders = Order.where(movie_id: params[:movie_id])
    else
      @orders = Order.all
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Order completed.' }
        format.js
      else
        format.html { render 'new' }
        format.js
      end
    end
  end

  protected

  def order_params
    params.require(:order).permit(*order_param_keys)
  end

  def order_param_keys
    %i(customer_name customer_email credit_card_number
       credit_card_cvv credit_card_expiration billing_address_1
       billing_address_2 billing_zipcode movie_id showtime_id)
  end
end
