# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_delivered(order_email)
    mail to: order_email, subject: 'Your order is delivered'
  end
end
