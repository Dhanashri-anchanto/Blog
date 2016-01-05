class ToRemoveColumnfromPost1 < ActiveRecord::Migration
  def change
  	remove_column :posts, :tag_id
  end
end
