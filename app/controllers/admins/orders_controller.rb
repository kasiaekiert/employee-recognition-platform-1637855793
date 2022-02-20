# frozen_string_literal: true

module Admins
  class OrdersController < Admins::BaseController
    def index
      render :index, locals: { orders: Order.includes(:employee).order(status: :desc) }
    end

    def change_status
      order = Order.find(params[:id])
      order.update(status: 'delivered')
      redirect_to admins_orders_path, notice: "Order delivered"
    end

    private

    def orders_params
      params.require(:order).permit(:employee_id, :reward_id, :status)
    end
  end
end
