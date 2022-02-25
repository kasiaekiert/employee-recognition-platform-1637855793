# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
  password: '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',
  domain: 'protected-fortress-07924.herokuapp.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}