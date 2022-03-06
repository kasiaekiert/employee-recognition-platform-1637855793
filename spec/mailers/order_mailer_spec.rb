# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderMailer, type: :mailer do
  describe 'Deliver Order Confiramtion Mail' do
    let(:order) { create(:order) }
    let(:mail) { described_class.with(order_email: order.employee.email).order_delivered }

    it 'renders the receiver' do
      expect(mail.to).to have_content(order.employee.email)
    end

    it 'renders the sender' do
      expect(mail.from).to have_content('kasia.ekiert@gmail.com')
    end

    it 'renders the body' do
      expect(mail.body.encoded).to have_content('This is your REWARD!')
    end
  end
end
