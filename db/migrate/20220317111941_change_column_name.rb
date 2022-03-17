class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :employees, :available_kudos, :number_of_available_kudos
  end
end
