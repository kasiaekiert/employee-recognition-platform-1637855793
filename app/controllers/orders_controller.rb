# frozen_string_literal: true

class OrdersController < ApplicationController
  class NotAllowedError < StandardError; end

  before_action :authenticate_employee!

  def create
    order = current_employee.orders.new(orders_params)

    if reward_availability && order.save
      redirect_to rewards_path, notice: 'Your purchase was successful.'
    else
      redirect_to rewards_path, notice: 'Your purchase was NOT successful.'
    end
  end

  private

  def orders_params
    params.require(:order).permit(:employee_id, :reward_id)
  end

  def reward_availability
    reward = Reward.find(orders_params[:reward_id])

    if current_employee.received_kudos.count <= reward.price
      raise NotAllowedError
    else
      true
    end
  end
end
