class ChangeCustomerEmailToString < ActiveRecord::Migration
  def change
    change_column :orders, :customer_email, :string
  end
end
