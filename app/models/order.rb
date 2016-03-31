class Order < ActiveRecord::Base
  belongs_to :movie, inverse_of: :orders
  belongs_to :showtime, inverse_of: :orders
  belongs_to :theatre, inverse_of: :orders

  validates :customer_name, presence: true
  validates :customer_email, presence: true,
                             email: true
  validates :credit_card_number, presence: true,
                                 credit_card_number: true,
                                 numericality: { greater_than: 0 }
  validates :credit_card_cvv, presence: true,
                              length: { maximum: 3 },
                              numericality: { greater_than: 0 }
  validates :credit_card_expiration, presence: true
  validates :billing_address_1, presence: true
  validates :billing_zipcode, presence: true,
                              numericality: { greater_than: 0 }

  def purchase_amount
    if showtime.time.hour < 4
      "$11.00"
    else
      "$15.00"
    end
  end
end
