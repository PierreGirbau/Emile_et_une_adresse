class AddGooglePlaceIdToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :google_place_id, :string
  end
end
