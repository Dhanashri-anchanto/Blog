class TagsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]
  before_filter :set_tag, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tags = Tag.all
    respond_with(@tags)
  end

  def show
    
    @posts = @tag.posts
    respond_with(@tag)
  end

  def new
    @tag = Tag.new
    respond_with(@tag)
  end

  def edit
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.valid?
      @tag.save
      redirect_to tag_path(@tag)
    else
      respond_with(@tag)
    end
  end

  def update
    if @tag.valid?
      @tag.update_attributes(params[:tag])
      redirect_to tag_path(@tag)
    else
      respond_with(@tag)
    end

  end

  def destroy
    @tag.destroy
    respond_with(@tag)
  end

  private
  def set_tag
    @tag = Tag.find_by_permalink(params[:id])
  end
end
