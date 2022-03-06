# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_delivered
    OrderMailer.with(order_email: 'employee1@mail.com').order_delivered
  end
end
