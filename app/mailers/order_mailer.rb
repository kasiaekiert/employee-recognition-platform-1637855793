# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_delivered
    mail to: params[:order_email], subject: 'Your order is delivered'
  end
end
