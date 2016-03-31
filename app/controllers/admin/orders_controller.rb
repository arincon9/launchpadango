module Admin
  class OrdersController < ApplicationController
    def index
      if params[:movie_id].present?
        @orders = Order.where(movie_id: params[:movie_id])
      else
        @orders = Order.all
      end
    end
  end
end
