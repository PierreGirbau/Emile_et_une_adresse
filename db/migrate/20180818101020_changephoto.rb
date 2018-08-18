class Changephoto < ActiveRecord::Migration[5.1]
  def change
  	rename_column :places, :photo, :photo_google
  	rename_column :places, :photo_upload, :photo
  end
end
