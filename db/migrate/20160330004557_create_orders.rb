class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :movie, index: true, foreign_key: true
      t.references :showtime, index: true, foreign_key: true
      t.string :customer_name
      t.integer :credit_card_number
      t.integer :credit_card_cvv
      t.date :credit_card_expiration
      t.string :billing_address_1
      t.string :billing_address_2
      t.integer :billing_zipcode
      t.text :customer_email

      t.timestamps null: false
    end
  end
end
