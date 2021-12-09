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

  def update
    kudo = Kudo.find(params[:id])
    if kudo.update(kudo_params)
      redirect_to kudos_path(kudo), notice: 'Kudo was successfully updated.'
    else
      render :edit, locals: { kudo: kudo, presenter: KudoPresenter.new }
    end
  end

  def edit
    kudo = Kudo.find(params[:id])
    render :edit, locals: { kudo: kudo, presenter: KudoPresenter.new }
  end

  def show; end

  def destroy
    kudo = Kudo.find(params[:id])
    redirect_to kudos_path, notice: 'Kudo was successfully destroyed.'
  end

  private

  def kudo_params
    params.require(:kudo).permit(:name, :content, :user_id, :title, :employee_id)
  end
end
