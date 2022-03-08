class AddAvailableKudosToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :available_kudos, :integer, default: 1
  end
end
