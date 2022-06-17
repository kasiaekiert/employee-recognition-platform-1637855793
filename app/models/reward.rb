# frozen_string_literal: true

class Reward < ApplicationRecord
  has_many :category_rewards, dependent: :destroy
  has_many :categories, through: :category_rewards, dependent: :destroy
  has_one_attached :image

  validates :price, numericality: { greater_than_or_equal_to: 1 }

  scope :paginate, lambda { |page:, per_page: 10|
    page = (page || 1).to_i
    per_page = per_page.to_i

    current_scope = limit(per_page).offset(per_page * (page - 1))

    PaginationResult.new(current_scope).tap do |result|
      result.current_page = page
      result.total_pages = (count / per_page.to_f).ceil
    end
  }

  class PaginationResult < SimpleDelegator
    attr_accessor :current_page, :total_pages
  end

  def reward_purchasable?(employee)
    employee.earned_points >= price
  end

  def attributes
    { 'title' => nil, 'description' => nil, 'price' => nil }
  end
end
