# frozen_string_literal: true

module Admins
  class CompanyValuesController < Admins::BaseController
    def index
      render :index, locals: { company_values: CompanyValue.all }
    end

    def show
      render :show, locals: { company_value: company_value }
    end

    def new
      render :new, locals: { company_value: CompanyValue.new }
    end

    def edit
      render :edit, locals: { company_value: company_value }
    end

    def create
      new_company_value = CompanyValue.new(company_value_params)

      if new_company_value.save
        redirect_to admins_company_values_path, notice: 'New Company Value was successfully created.'
      else
        render :new, locals: { company_value: new_company_value }
      end
    end

    def update
      if company_value.update(company_value_params)
        redirect_to admins_company_value_path(company_value), notice: 'Company Value was successfully updated.'
      else
        render :edit, locals: { company_value: company_value }
      end
    end

    def destroy
      company_value.destroy
      redirect_to admins_company_values_path, notice: 'Company Value was successfully destroyed.'
    end

    private

    def company_value
      @company_value ||= CompanyValue.find(params[:id])
    end

    def company_value_params
      params.require(:company_value).permit(:title)
    end
  end
end
