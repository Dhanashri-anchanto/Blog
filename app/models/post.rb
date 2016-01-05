class Post < ActiveRecord::Base
  attr_accessible :title, :body,:category_id, :tag_ids, :user_id
  has_permalink :title
  

belongs_to :user, :foreign_key => "user_id"

  has_many :comments
 # has_many :tags, :as => :taggable
  belongs_to :category
  #has_one :user, :foreign_key => "category_id"

has_many :post_tags
has_many :tags, :through => :post_tags


  #belongs_to :tag, :foreign_key => "tag_ids"

 validates_presence_of :body, :title, :category_id

 # def to_param
 # permalink
  #end
end
