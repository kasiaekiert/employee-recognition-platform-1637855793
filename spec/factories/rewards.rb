# frozen_string_literal: true

FactoryBot.define do
  factory :reward do
    title { 'January the best employee' }
    description { 'Reward for the best employee of January' }
    price { '1000' }
  end
end
