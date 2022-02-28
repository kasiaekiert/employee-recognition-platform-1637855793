# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'kasia.ekiert@gmail.com'
  layout 'mailer'
end
