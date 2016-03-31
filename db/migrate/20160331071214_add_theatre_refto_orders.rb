class AddTheatreReftoOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :theatre, index: true, foreign_key: true
  end
end
