require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { orders(:bob_watches_interstellar)}

  describe "associations" do
    it { should belong_to(:movie).inverse_of(:orders) }
    it { should belong_to(:showtime).inverse_of(:orders) }
    it { should belong_to(:theatre).inverse_of(:orders) }
  end

  describe "validations" do
    it { should validate_presence_of(:customer_name) }
    it { should validate_presence_of(:customer_email) }
    it { should validate_presence_of(:credit_card_number) }
    it { should validate_presence_of(:credit_card_cvv) }
    it { should validate_presence_of(:credit_card_expiration) }
    it { should validate_presence_of(:billing_address_1) }
    it { should validate_presence_of(:billing_zipcode) }

    it { should validate_numericality_of(:credit_card_number) }

    describe "validating available capacity" do
      def dup_interstellar_order
        orders(:bob_watches_interstellar).dup.tap do |order|
          order.theatre = theatres(:small_theatre)
          order.showtime = sold_out_showtime
        end
      end

      let!(:singular_order) { dup_interstellar_order.save! }
      let(:sold_out_showtime) { showtimes(:monday_morning) }

      it "should not allow a new order for a sold out showtime" do
        invalid_order = dup_interstellar_order

        expect(invalid_order).to_not be_valid
      end
    end
  end
end
