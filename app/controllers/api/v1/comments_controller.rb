class Api::V1::CommentsController < ApplicationController
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token

  def index
    @post = Post.find(params[:post_id])
    render json: { success: true, data: { comments: @post.comments } }
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text: comment_params[:text], author_id: @post.author_id)

    if @comment.save
      render json: { success: true, data: { comment: @comment } }, status: :created
    else
      render json: { success: false, error: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
