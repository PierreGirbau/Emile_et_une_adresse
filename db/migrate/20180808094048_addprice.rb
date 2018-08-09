class Addprice < ActiveRecord::Migration[5.1]
  def change
  	add_column :details, :price, :integer
  end
end
