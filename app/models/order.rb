class Order < ActiveRecord::Base
  belongs_to :movie, inverse_of: :orders
  belongs_to :showtime, inverse_of: :orders

  validates :customer_name, presence: true
  validates :customer_email, presence: true
  validates :credit_card_number, presence: true
  validates :credit_card_cvv, presence: true,
                              length: { maximum: 3 }
  validates :credit_card_expiration, presence: true
  validates :billing_address_1, presence: true
  validates :billing_zipcode, presence: true
end
