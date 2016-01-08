class Post < ActiveRecord::Base
  attr_accessible :title, :body,:category_id, :tag_ids, :user_id
  has_permalink :title
  
  belongs_to :user, :foreign_key => "user_id"
  has_many :comments, :dependent => :destroy
  belongs_to :category
  has_many :post_tags, :dependent => :destroy
  has_many :tags, :through => :post_tags


  validates_presence_of :body
  validates_presence_of :title
  validates_presence_of :category_id
  

  validate :at_least_one_category_selected
  def to_param
    permalink
  end

  private

  def at_least_one_category_selected
    if self.tag_ids.blank?
      self.errors.add(:tag_ids, "You must select at least one tag.")
    end
  end

end
