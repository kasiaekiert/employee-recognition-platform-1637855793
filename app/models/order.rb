# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :employee
  belongs_to :reward
  scope :filter_by_status, ->(status) { where(status: status) }

  enum status: {
    undelivered: 0,
    delivered: 1
  }

  def deserialized_reward
    ActiveSupport::JSON.decode(reward_snapshot)
  end
end
