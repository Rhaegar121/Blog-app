class Api::V1::PostsController < ApplicationController
    load_and_authorize_resource

    def index
      @user = User.find(params[:user_id])
      @posts = @user.posts
      render json: { success: true, data: { posts: @posts } }
    end
end
  