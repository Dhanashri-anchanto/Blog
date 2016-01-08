class PostsController < ApplicationController

  before_filter :authenticate_user!, :except => [ :index, :show ]
  before_filter :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    @@temp = Category.find_by_permalink(params[:id])
    respond_with(@post.category.id,@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(params[:post])
    
    if @post.valid?
      @post.save
      redirect_to category_post_path(@post.category , @post)
    else
      respond_with(@post)
    end
    #some_hash=params[:post]
    #s = some_hash["tag_ids"].size
    #puts "#{s}"
    #for i in 0...s
      #puts "#{i} => #{some_hash["tag_ids"][i]}"
    #end
    #puts some_hash
  end 
  

  def update
    if @post.valid?
      @post.update_attributes(params[:post])
      redirect_to category_post_path(@post.category, @post)
    else
      respond_with(@post)
    end
  end

  def destroy
    @post.destroy
    redirect_to categories_path
  end

  
  private
  def set_post
    
    @post = Post.find_by_permalink(params[:id])
    
  end
end
