class CreateCategoryRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :category_rewards do |t|
      t.belongs_to :category
      t.belongs_to :reward

      t.timestamps
    end
  end
end
