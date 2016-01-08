class Tag < ActiveRecord::Base
	attr_accessible :name, :taggable_id, :taggable_type, :user_id

	has_permalink :name
	belongs_to :taggable, :polymorphic => true
	has_many :post_tags
	has_many :posts, :through => :post_tags
	belongs_to :user

	validates :name, :presence => true
	

	def to_param
		permalink
	end
end
