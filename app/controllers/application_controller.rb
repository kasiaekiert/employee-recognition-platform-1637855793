# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def pundit_user
    current_user = current_employee
  end

  add_flash_types :info, :primary, :success, :danger
end
