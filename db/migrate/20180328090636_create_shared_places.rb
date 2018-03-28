class CreateSharedPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :shared_places do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.boolean :visible

      t.timestamps
    end
  end
end
