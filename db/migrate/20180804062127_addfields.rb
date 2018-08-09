class Addfields < ActiveRecord::Migration[5.1]
  def change
  	add_column :places, :comment, :text
  	remove_column :details, :comment, :text
  	remove_column :details, :price, :integer
  	add_column :places, :price, :integer
  end
end
