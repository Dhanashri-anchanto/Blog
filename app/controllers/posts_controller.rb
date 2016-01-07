class PostsController < ApplicationController

  before_filter :authenticate_user!, :except => [ :index, :show ]
  before_filter :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.all
   # @t= PostTag.where(:post_id => 23).all
   # p "=============="
   # p @t

    
  # @t1= Tag.where(:id => @t.tag_id)
   p "============== @t1"
   # p @t1
    respond_with(@posts)
  end

  def show
@@temp = Category.find_by_permalink(params[:id])
   # @temp = Category.find(params[:id])
   #@category = Category.find_by_permalink(params[:id => @post.category_id])
    respond_with(@post.category.id,@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    p '********************************************************'
    @post = Post.new(params[:post])
    @post.save
     p '********************************************************'

   #some_hash=params[:post]
    #s = some_hash["tag_ids"].size
    #puts "#{s}"
    #for i in 0...s

      #puts "#{i} => #{some_hash["tag_ids"][i]}"

       
    #end


    #puts some_hash

    
    redirect_to category_post_path(@post.category , @post)
  end

  def update
    # raise params.inspect
    puts "updates1"
    @post.update_attributes(params[:post])
    


redirect_to category_post_path(@post.category, @post)


    #redirect_to @post
    # respond_with(@post)
  end

  def destroy
    
    @post.destroy
     ## Comment.where(:post_id => params[:id]).destroy_all
    # PostTag.where(:post_id => params[:id]).destroy_all
    redirect_to categories_path
  end

  
  private
    def set_post
      
      @post = Post.find_by_permalink(params[:id])
     
    end
end
