class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	 t.references :post
      t.string :name
      t.string :taggable_type
      t.integer :taggable_id

      t.timestamps



       
    end
    add_index :tags, :post_id
    end
  end
