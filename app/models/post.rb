class Post < ActiveRecord::Base
  attr_accessible :title, :body,:category_id, :tag_ids, :user_id
  has_permalink :title
  
  belongs_to :user, :foreign_key => "user_id"
  has_many :comments, :dependent => :delete_all
  belongs_to :category
  has_many :post_tags, :dependent => :delete_all
  has_many :tags, :through => :post_tags
  validates_presence_of :body, :title, :category_id

def to_param
  permalink
  end
end
