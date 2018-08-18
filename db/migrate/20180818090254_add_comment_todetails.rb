class AddCommentTodetails < ActiveRecord::Migration[5.1]
  def change
  	add_column :details, :comment, :text
  end
end
