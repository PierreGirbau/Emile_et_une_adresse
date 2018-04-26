class DropDetailedCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :detailed_categories
  end
end
