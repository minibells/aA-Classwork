class PostsController < ApplicationController
  before_action :require_logged_in!, except: [:show]
  before_action :is_op?, only: [:update, :edit]
  helper_method :is_op?

  def new
    @subs = Sub.all
    @post = Post.new
    render :new
  end

  def show
    @sub = Sub.find(params[:sub_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.where(parent_id: nil)
    render :show
  end 

  def create
    @subs = Sub.all
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # debugger
    if @post.save
      params[:sub_ids].each do |sub_id|
        PostSub.create!(post_id: @post.id, sub_id: sub_id)
      end
      redirect_to sub_url(params[:sub_ids][0])
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:sub_id])
    @post = Post.find(params[:id])
    unless is_op?
      redirect_to sub_post_url(@sub, @post) 
    else
      render :edit 
    end
  end

  def update
    @sub = Sub.find(params[:sub_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to sub_post_url(@sub, @post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def is_op?
    @post = Post.find(params[:id])
    @post.user_id == current_user.id
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
