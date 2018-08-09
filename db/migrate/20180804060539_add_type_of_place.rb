class AddTypeOfPlace < ActiveRecord::Migration[5.1]
  def change
  	add_column :details, :type_of_place, :string
  	remove_column :places, :type_of_place, :string
  end
end
