class RemovePlaceIdFromPlaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :place_id, :integer
  end
end
