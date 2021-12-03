class KudosController < ApplicationController
  before_action :authenticate_employee!

  def index
    @kudos = Kudo.all
  end

  def new
    @kudo = Kudo.new
  end

  def create
    @kudo = Kudo.new(kudo_params)

    if @kudo.save
      redirect_to kudos_path, notice: 'Kudo was successfully created.'
    else
      render :new
    end
  end

  private
  
  def kudo_params
    params.require(:kudo).permit(:name, :content, :user_id, :title, :employee_id)
  end
end
