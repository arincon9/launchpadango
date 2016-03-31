class OrderMailer < ApplicationMailer

  def email_receipt(order)
    @order = order
    @greeting = "Hi"

    mail to: order.customer_email, subject: "Your Movie Receipt"
  end
end
