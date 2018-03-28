class AddHeartCapacityToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :heart_capacity, :integer
  end
end
