class ToRemoveColumnfromPost < ActiveRecord::Migration
  def change 
  	remove_column :posts, :category_name
  end
end
