class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show, :topic ]
  before_filter :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def show

    @temp = Category.find_by_permalink(params[:id])
  p "========#{@temp}"
    #@post=Post.find(:category_id => @temp.id) #.where(:category_id => id)
@post =@temp.posts
   # @post = Post.find(:category_id => params[:id])
    puts "#{@post}"
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(params[:category])
    @category.save
    respond_with(@category)
  end

  def update
    @category.update_attributes(params[:category])
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end


 private
    def set_category
      @category = Category.find_by_permalink(params[:id])
    end
end
