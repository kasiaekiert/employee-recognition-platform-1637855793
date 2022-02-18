# frozen_string_literal: true

module Admins
  class OrdersController < Admins::BaseController
    def index
      render :index, locals: { orders: Order.includes(:employee) }
    end
  end
end
