module Admin
  class OrdersController < ApplicationController
    def index
      if params[:movie_id].present?
        @orders = Order.where(movie_id: params[:movie_id])
      else
        @orders = Order.all
      end

      respond_to do |format|
        format.html
        format.js { render partial: 'list', locals: { orders: @orders }, status: 200 }
      end
    end
  end
end
