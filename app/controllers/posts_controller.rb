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
   # @posts = Post.find_by_permalink(params[:id])
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    p '********************************************************'
   # p params
    #params["post"].merge!(:category_name => )
    @post = Post.new(params[:post])

    @post.save
     p '********************************************************'

   some_hash=params[:post]
    s = some_hash["tag_ids"].size
    puts "#{s}"
    for i in 0...s

      puts "#{i} => #{some_hash["tag_ids"][i]}"

        #@tagpost = PostTag.new(:post_id => @post.id , :tag_id => some_hash["tag_ids"][i])
        #@tagpost.save
    end


    #puts some_hash

    
    respond_with(@post)
  end

  def update
    # raise params.inspect
    puts "updates1"
    @post.update_attributes(params[:post])
    
    redirect_to @post
    # respond_with(@post)
  end

  def destroy
    @post.destroy
      Comment.where(:post_id => params[:id]).destroy_all
     PostTag.where(:post_id => params[:id]).destroy_all
    respond_with(@post)
  end

  def dhanashri
  @temp = Category.find(params[:id])

  p "========#{@temp}"

    #@post=Post.find(:category_id => @temp.id) #.where(:category_id => id)

@post =Post.where(:category_id => @temp.id)
   # @post = Post.find(:category_id => params[:id])
    puts "#{@post}"
   # respond_with(@post)

  end

  def dhanashritag

    p params
    @t = PostTag.where(:tag_id => params[:id]).all
    puts "=================******************8"
    puts "#{ @t}"

    # @t.each do |n|
    #  puts "#{n}"
    #  @post = Post.where(:id => n.post_id)
     # @tag = Tag.where(:id => n.tag_id)

    # puts "===========*****"
    #  puts @tag
    # end
#==========find all posts with single tag id=========
   # @post = Post.where(:id => @t.post_id) #.where(:id => @t.tag_id)

puts "**********"
  # puts  @post.id
   # @post =Post.where(:category_id => @temp.id)

    #@t = PostTag.find(params[:id])
    #@post =Post.where(:id => @t.post_id)
    #puts "#{@t}"


  end

  private
    def set_post
      #raise params.inspect
      #@post = Post.find(params[:id])
      @post = Post.find_by_permalink(params[:id])
     # @post = Post.find_by_slug(params[:id])
    end
end
