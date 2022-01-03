# frozen_string_literal: true

module Admins
  class KudosController < Admins::BaseController
    def index
      render :index, locals: { kudos: Kudo.includes(:giver, :receiver).all }
    end

    def show
      render :show, locals: { kudo: kudo, presenter: KudoPresenter.new }
    end

    def new
      render :new, locals: { kudo: Kudo.new, presenter: KudoPresenter.new }
    end

    def edit
      render :edit, locals: { kudo: kudo, presenter: KudoPresenter.new }
    end

    def create
      record = Kudo.new(kudo_params)

      if record.save
        redirect_to admins_kudos_path, notice: 'Kudo was successfully created.'
      else
        render :new, locals: { kudo: record, presenter: KudoPresenter.new }
      end
    end

    def update
      if kudo.update(kudo_params)
        redirect_to admins_kudo_path(kudo), notice: 'Kudo was successfully updated.'
      else
        render :edit, locals: { kudo: kudo, presenter: KudoPresenter.new }
      end
    end

    def destroy
      kudo.destroy
      redirect_to admins_kudos_path, notice: 'Kudo was successfully destroyed.'
    end

    private

    def kudo
      @kudo ||= Kudo.find(params[:id])
    end

    def kudo_params
      params.require(:kudo).permit(:content, :title, :receiver_id, :giver_id)
    end
  end
end
