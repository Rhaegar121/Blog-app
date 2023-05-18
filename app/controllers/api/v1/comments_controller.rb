class Api::V1::CommentsController < ApplicationController
    load_and_authorize_resource

    def index
      @comments = Comment.where(post_id: params[:post_id]).order('created_at')
      render json: { success: true, data: { comments: @comments } }
    end

    # def create
    #     @post = Post.find(params[:post_id])
    #     @comment = Comment.new(comment_params)
    #     @comment.author_id = current_user.id
    #     @comment.post_id = @post.id
        
    #     if @comment.save
    #       render json: { success: true, data: { comment: @comment } }, status: :created
    #     else
    #       render json: { success: false, error: @comment.errors.full_messages }, status: :unprocessable_entity
    #     end
    # end
      
    private
      
    def comment_params
      params.require(:comment).permit(:text)
    end
end
  