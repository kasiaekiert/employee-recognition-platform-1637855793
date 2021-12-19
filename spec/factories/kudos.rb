# frozen_string_literal: true

FactoryBot.define do
  factory :kudo do
    title { 'kudo title' }
    content { 'content of the first kudo' }
    employee
  end
end
