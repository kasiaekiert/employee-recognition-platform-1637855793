# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    employee
    reward
    status
  end
end
