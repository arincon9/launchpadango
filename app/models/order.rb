class Order < ActiveRecord::Base
  belongs_to :movie, inverse_of: :orders
  belongs_to :showtime, inverse_of: :orders, counter_cache: true
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

  validate :capacity_is_available

  def purchase_amount
    if cached_showtime_time.hour < 16
      "$11.00"
    else
      "$15.00"
    end
  end

  def capacity_is_available
    if showtime.sold_out?
      errors.add(:showtime, "This show is sold out.")
    end
  end
end
