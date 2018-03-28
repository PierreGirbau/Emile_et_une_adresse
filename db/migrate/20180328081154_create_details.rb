class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.text :comment
      t.string :season
      t.integer :price

      t.timestamps
    end
  end
end
