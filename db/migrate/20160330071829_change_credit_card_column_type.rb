class ChangeCreditCardColumnType < ActiveRecord::Migration
  def change
    change_column :orders, :credit_card_number, :string
  end
end
