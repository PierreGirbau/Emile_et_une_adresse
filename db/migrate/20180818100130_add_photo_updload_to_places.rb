class AddPhotoUpdloadToPlaces < ActiveRecord::Migration[5.1]
  def change
  	add_column :places, :photo_upload, :string
  end
end
