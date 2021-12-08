class KudoPresenter
  def employees_for_select
    Employee.order(:email)
  end
end
