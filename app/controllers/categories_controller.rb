class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show, :topic ]
  before_filter :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5) #.order("id DESC")
    respond_with(@categories) 
  end

  def show
    #raise params.inspect
    @temp = Category.find_by_permalink(params[:id])
    @post =@temp.posts
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
    if @category.valid?
      @category.save
      redirect_to category_path(@category)
    else
      respond_with(@category)
    end
  end

  def update
    if @category.valid?
      @category.update_attributes(params[:category])
      redirect_to category_path(@category)
    else
      respond_with(@category)
    end
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
