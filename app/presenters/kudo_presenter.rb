# frozen_string_literal: true

class KudoPresenter
  def employees_for_select
    Employee.order(:email)
  end
end
