class SubsController < ApplicationController
  before_action :is_moderator?, only: [:update, :edit]
  helper_method :is_moderator?

  def new
    @sub = Sub.new
    render :new
  end 

  def index 
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    @posts = @sub.posts
    # @posts = Post.where(:sub_ids.include?@sub.id)
    render :show
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit 
  end

  def update
    @sub = Sub.find(params[:id])
    unless is_op?
      redirect_to sub_post_url(@sub, @post) 
      if @sub.update(sub_params)
        redirect_to sub_url(@sub)
      else
        flash.now[:errors] = @sub.errors.full_messages
        render :edit
      end
    else 
        render :edit
    end
  end 

  def is_moderator?
    @sub = Sub.find(params[:id])
    @sub.moderator_id == current_user.id
  end



  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
