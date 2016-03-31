class ChangeCreditCvvAndZipcodeToString < ActiveRecord::Migration
  def change
    change_column :orders, :credit_card_cvv, :string
    change_column :orders, :billing_zipcode, :string
  end
end
