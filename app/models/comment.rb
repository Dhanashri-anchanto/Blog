class Comment < ActiveRecord::Base
	attr_accessible :body, :user_id, :post_id

	belongs_to :user, :foreign_key => "user_id"
	belongs_to :post, :foreign_key => "post_id"

	validates :body, :presence => true
end
