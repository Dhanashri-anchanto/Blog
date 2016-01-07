class ToRemoveColumnsFromTag < ActiveRecord::Migration
  def change
  	remove_column :tags, :post_id
  	remove_column :tags, :taggable_type
  	remove_column :tags, :taggable_id
  end
end
