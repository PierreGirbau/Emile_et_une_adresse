class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.boolean :open_now
      t.string :name
      t.string :type
      t.string :waiting_time
      t.integer :total_heart
      t.float :average_price
      t.string :phone_number
      t.string :website
      t.string :address
      t.string :periods

      t.timestamps
    end
  end
end
