require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "email_receipt" do
    let(:mail) { OrderMailer.email_receipt }

    it "renders the headers" do
      expect(mail.subject).to eq("Email receipt")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
