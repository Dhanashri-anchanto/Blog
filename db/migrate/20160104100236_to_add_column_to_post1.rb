class ToAddColumnToPost1 < ActiveRecord::Migration
  def change
  	add_column :posts, :tag_ids , :integer
  end
end
