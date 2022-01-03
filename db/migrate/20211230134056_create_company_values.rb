class CreateCompanyValues < ActiveRecord::Migration[6.1]
  def change
    create_table :company_values do |t|
      t.string :title, null: false
    end
  end
end
