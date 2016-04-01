class OrdersController < ApplicationController
  before_action :load_movie, only: [:new, :create]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.movie = @movie
    @order.cached_movie_title  = @movie.title
    @order.cached_showtime_name = @order.showtime.display_name

    respond_to do |format|
      if @order.save
        OrderMailer.email_receipt(@order).deliver
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
       billing_address_2 billing_zipcode showtime_id)
  end

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end
end
