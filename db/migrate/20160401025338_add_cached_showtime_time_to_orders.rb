class AddCachedShowtimeTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cached_showtime_time, :datetime
  end
end
