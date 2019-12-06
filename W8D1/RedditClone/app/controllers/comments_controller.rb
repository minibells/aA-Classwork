class CommentsController < ApplicationController

  def show
    @sub = Sub.find(params[:sub_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    render :show
  end

  def new
    @comment = Comment.new
    @sub = params[:sub_id]
    @post = params[:post_id]
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if params[:id]
      @comment.parent_id = params[:id]
    end
    @sub = params[:sub_id]
    @post = params[:post_id]
    @comment.save
    # debugger
    flash.now[:errors] = @comment.errors.full_messages
    redirect_to sub_post_url(@sub, @post)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
