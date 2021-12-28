# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    sequence(:email) { |i| "admin#{i}@test.com" }
    password { 'password' }
  end
end
