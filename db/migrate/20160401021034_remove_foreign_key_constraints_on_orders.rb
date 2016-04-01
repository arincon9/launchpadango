class RemoveForeignKeyConstraintsOnOrders < ActiveRecord::Migration
  def change
    remove_foreign_key :orders, :movies
    remove_foreign_key :orders, :theatres
  end
end
