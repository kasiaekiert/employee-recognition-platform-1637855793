class UsersController < ApplicationController
  before_action :authenticate_employee!

  def index
  end
end
