# frozen_string_literal: true

class KudosController < ApplicationController
  before_action :authenticate_employee!
  # before_action :check_available_kudos

  def index
    render :index, locals: { kudos: Kudo.includes(:giver, :receiver, :company_value).all }
  end

  def new
    render :new, locals: { kudo: Kudo.new, presenter: KudoPresenter.new }
  end

  def show
    render :show, locals: { kudo: kudo, presenter: KudoPresenter.new }
  end

  def create
    record = Kudo.new(kudo_params)
    record.giver = current_employee

    if record.save
      employee_kudos = current_employee.available_kudos
      current_employee.available_kudos = employee_kudos - 1
      current_employee.save!
      redirect_to kudos_path, notice: 'Kudo was successfully created.'
    else
      render :new, locals: { kudo: record, presenter: KudoPresenter.new }
    end
  end

  def update
    if kudo.update(kudo_params)
      redirect_to kudo_path(kudo), notice: 'Kudo was successfully updated.'
    else
      render :edit, locals: { kudo: kudo, presenter: KudoPresenter.new }
    end
  end

  def edit
    render :edit, locals: { kudo: kudo, presenter: KudoPresenter.new }
  end

  def destroy
    kudo.destroy
    redirect_to kudos_path, notice: 'Kudo was successfully destroyed.'
  end

  private

  def kudo_params
    params.require(:kudo).permit(:content, :title, :receiver_id, :company_value_id)
  end

  def kudo
    @kudo ||= Kudo.find(params[:id])
  end

  def check_available_kudos
    if current_employee.available_kudos <= 0
      @kudos_warning = "You can't write more than 5 kudos"
    end
  end
end
