require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "email_receipt" do
    let(:order) { orders(:bob_watches_interstellar) }
    let(:mail) { OrderMailer.email_receipt(order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your Movie Receipt")
      expect(mail.to).to eq(["bob@hotmail.com"])
      expect(mail.from).to eq(["alejandro.rincon9@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Thanks for purchasing a movie ticket.")
    end
  end
end
