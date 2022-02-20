# frozen_string_literal: true

module Admins
  class EmployeesController < Admins::BaseController
    def index
      render :index, locals: { employees: Employee.all }
    end

    def show
      render :show, locals: { employee: employee }
    end

    def edit
      render :edit, locals: { employee: employee }
    end

    def update
      if employee.update(employee_params)
        redirect_to admins_employee_path(employee), notice: 'Employee was successfully updated.'
      else
        render :edit, locals: { employee: employee }
      end
    end

    def destroy
      employee.destroy
      redirect_to admins_employees_path, notice: 'Employee was successfully destroyed.'
    end

    private

    def employee
      @employee ||= Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:email)
    end
  end
end
