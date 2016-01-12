class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #before_create { generate_token(:auth_token) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable, 
         :lockable, :timeoutable  #, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  :username, :first_name, :last_name, :gender, :mobile, :birthdate, :image

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }   #, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  # attr_accessible :title, :body
  has_many :comments
  has_many :posts
  has_many :categories
  has_many :tags

  validates_presence_of :username

#   def generate_token(column)
#   begin
#     self[column] = SecureRandom.urlsafe_base64
#   end while User.exists?(column => self[column])
# end
end
