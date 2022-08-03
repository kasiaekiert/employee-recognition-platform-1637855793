# frozen_string_literal: true

require 'csv'

module Admins
  class OrdersController < Admins::BaseController
    def index
      render :index, locals: { orders: Order.includes(:employee).order(status: :asc) }
    end

    def change_status
      order = Order.find(params[:id])
      order_email = order.employee.email
      order.update(status: 'delivered')
      OrderMailer.with(order_email: order_email).order_delivered.deliver_now
      redirect_to admins_orders_path, notice: 'Order delivered'
    end

    def export
      @orders = Order.all

      respond_to do |format|
        format.csv do
          filename = ['Orders', Time.zone.today].join(' ')
          response.headers['Content-Type'] = 'text/csv'
          response.headers['Content-Disposition'] = "attachment; filename=#{filename}.csv"
          render template: 'admins/orders/export'
        end
      end
    end

    private

    def orders_params
      params.require(:order).permit(:employee_id, :reward_id, :status)
    end
  end
end
