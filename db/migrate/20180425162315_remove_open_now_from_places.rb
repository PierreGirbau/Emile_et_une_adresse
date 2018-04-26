class RemoveOpenNowFromPlaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :open_now, :boolean
  end
end
