class CommentController < ApplicationController
    def new
        @comment = Comment.new
    end
end
