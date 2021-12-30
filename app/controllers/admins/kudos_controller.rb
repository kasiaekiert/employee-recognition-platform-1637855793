# frozen_string_literal: true

module Admins
  class KudosController < Admins::BaseController
    # GET /admins/kudos
    def index
      render :index, locals: { kudos: Kudo.includes(:giver, :receiver).all }
    end

    # GET /admins/kudos/1
    def show
      render :show, locals: { kudo: kudo, presenter: KudoPresenter.new }
    end

    # GET /admins/kudos/new
    def new
      render :new, locals: { kudo: Kudo.new, presenter: KudoPresenter.new }
    end

    # GET /admins/kudos/1/edit
    def edit
      render :edit, locals: { kudo: kudo, presenter: KudoPresenter.new }
    end

    # POST /admins/kudos
    def create
      record = Kudo.new(kudo_params)

      if record.save
        redirect_to admins_kudos_path, notice: 'Kudo was successfully created.'
      else
        render :new, locals: { kudo: record, presenter: KudoPresenter.new }
      end
    end

    # PATCH/PUT /admins/kudos/1
    def update
      if kudo.update(kudo_params)
        redirect_to admins_kudo_path(kudo), notice: 'Kudo was successfully updated.'
      else
        render :edit, locals: { kudo: kudo, presenter: KudoPresenter.new }
      end
    end

    # DELETE /admins/kudos/1
    def destroy
      kudo.destroy
      redirect_to admins_kudos_path, notice: 'Kudo was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def kudo
      @kudo ||= Kudo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kudo_params
      params.require(:kudo).permit(:content, :title, :receiver_id, :giver_id)
    end
  end
end
