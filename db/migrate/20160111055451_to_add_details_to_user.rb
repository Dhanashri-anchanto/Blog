class ToAddDetailsToUser < ActiveRecord::Migration
	def up
		add_column :users, :first_name, :string
		add_column :users, :last_name, :string
		add_column :users, :gender, :string
		add_column :users, :mobile, :string
		add_column :users, :birthdate, :date
		add_attachment :users , :image

	end

	def down
		remove_attachment :users, :image
		remove_column :users, :birthdate
		remove_column :users, :mobile
		remove_column :users, :gender
		remove_column :users, :last_name
		remove_column :users, :first_name
	end
end
