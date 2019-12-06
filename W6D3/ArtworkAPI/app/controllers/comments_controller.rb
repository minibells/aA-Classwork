class CommentsController < ApplicationController 
  def index
    comment = Comment.where(author_id: params[:user_id])
    render json: comment
  end

  def artwork_index
    comment = Comment.where(artwork: params[:artwork_id])
    render json: comment
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    render json: comment
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:author_id, :artwork_id)
  end
end
