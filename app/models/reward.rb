# frozen_string_literal: true

class Reward < ApplicationRecord
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  def reward_purchasable?(employee)
    employee.received_kudos.count >= price
  end

  def attributes
    {'title' => nil, 'description' => nil, 'price' => nil}
  end
end
