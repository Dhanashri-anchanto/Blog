class ToAddColumnToTags < ActiveRecord::Migration
  def up
  	add_column :tags, :user_id, :integer
    add_index :tags, :user_id
   end

  def down
  	remove_column :tags, :user_id
  end
end
