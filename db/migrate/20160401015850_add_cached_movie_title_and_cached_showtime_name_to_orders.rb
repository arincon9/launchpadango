class AddCachedMovieTitleAndCachedShowtimeNameToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cached_movie_title, :string
    add_column :orders, :cached_showtime_name, :string
  end
end
