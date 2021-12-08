# frozen_string_literal: true

class KudosController < ApplicationController
  before_action :authenticate_employee!

  def index
    render :index, locals: { kudos: Kudo.all }
  end

  def new
    render :new, locals: { kudo: Kudo.new, presenter: KudoPresenter.new }
  end

  def create
    kudo = Kudo.new(kudo_params)

    if kudo.save
      redirect_to kudos_path, notice: 'Kudo was successfully created.'
    else
      render :new
    end
  end

  def edit; end
  def show; end

  private

  def kudo_params
    params.require(:kudo).permit(:name, :content, :user_id, :title, :employee_id)
  end
end
