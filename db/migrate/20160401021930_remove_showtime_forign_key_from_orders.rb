class RemoveShowtimeForignKeyFromOrders < ActiveRecord::Migration
  def change
    remove_foreign_key :orders, :showtimes
  end
end
