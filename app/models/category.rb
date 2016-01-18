class Category < ActiveRecord::Base
  attr_accessible :title, :user_id

  has_permalink :title
  has_many :posts, :dependent => :destroy
  belongs_to :user
  validates :title, :presence => true

   def to_param
  permalink
  end

  
end
