class RemoveTypeFromPlaces < ActiveRecord::Migration[5.1]
  def change
    remove_column :places, :type, :string
  end
end
