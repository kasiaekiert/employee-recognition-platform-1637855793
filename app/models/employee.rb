# frozen_string_literal: true

class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :given_kudos, class_name: 'Kudo', foreign_key: :giver, dependent: :destroy, inverse_of: :giver
  has_many :received_kudos, class_name: 'Kudo', foreign_key: :receiver, dependent: :destroy, inverse_of: :receiver
  has_many :orders, dependent: :destroy
  has_many :bought_rewards, through: :orders, source: :reward

  def earned_points
    received_kudos.count - bought_rewards.sum(:price)
  end
end
