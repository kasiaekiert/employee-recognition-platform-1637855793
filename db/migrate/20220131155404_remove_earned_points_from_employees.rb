class RemoveEarnedPointsFromEmployees < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :earned_points
  end
end
