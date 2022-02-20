# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :employee
  belongs_to :reward
  enum status: [:undelivered, :delivered]

  def deserialized_reward
    ActiveSupport::JSON.decode(reward_snapshot)
  end
end
