class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id

 belongs_to :user, :foreign_key => "user_id"
 belongs_to :post, :foreign_key => "post_id"
 # has_one :user
 has_many :tags, :as => :taggable
 #belongs_to :user, :foreign_key => "user_id"
end
