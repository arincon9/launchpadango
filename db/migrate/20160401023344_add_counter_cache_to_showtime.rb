class AddCounterCacheToShowtime < ActiveRecord::Migration
  def change
    add_column :showtimes, :orders_count, :integer, default: 0
  end
end
