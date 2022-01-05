# frozen_string_literal: true

class KudoPresenter
  def employees_for_select
    Employee.order(:email)
  end

  def company_values_for_select
    CompanyValue.order(:title)
  end
end
