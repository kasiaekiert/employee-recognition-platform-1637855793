# frozen_string_literal: true

class Employee < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :given_kudos, class_name: 'Kudo', foreign_key: :giver, dependent: :destroy
  has_many :received_kudos, class_name: 'Kudo', foreign_key: :receiver, dependent: :destroy
  has_many :orders
  has_many :bought_rewards, through: :orders, source: :reward

  def earned_points
    received_kudos.count - bought_rewards.sum(:price)
  end
end
