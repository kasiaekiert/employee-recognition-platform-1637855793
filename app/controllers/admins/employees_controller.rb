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
        redirect_to admins_employee_path(employee), info: 'Employee was successfully updated.'
      else
        render :edit, locals: { employee: employee }
      end
    end

    def destroy
      employee.destroy
      redirect_to admins_employees_path, danger: 'Employee was successfully destroyed.'
    end

    def kudos_for_all
      render :update_kudos_for_all, locals: { employees: Employee.all }
    end

    def update_kudos_for_all
      if Employee.all.each do |e|
           kudos = params[:employee][:additional_kudos].to_i
           e.number_of_available_kudos += kudos
           e.save!
         end
        redirect_to admins_employees_path, info: 'Employee was successfully updated.'
      else
        render :kudos_for_all, danger: 'Try again sth went wrong'
      end
    end

    private

    def employee
      @employee ||= Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:email, :number_of_available_kudos)
    end
  end
end
