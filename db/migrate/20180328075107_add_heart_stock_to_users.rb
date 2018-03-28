class AddHeartStockToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :heart_stock, :integer
  end
end
