class AddPhotoToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :photo, :string
  end
end
