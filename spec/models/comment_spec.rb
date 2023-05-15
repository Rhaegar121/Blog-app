require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment Model' do
    before do
      @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher')
      @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post')
      @comment = Comment.new(post_id: @post.id, author_id: @user.id, text: 'This is my first comment')
    end

    it 'text should not be blank' do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it 'post id must be integer' do
      @comment.post_id = 1.5
      expect(@comment).to_not be_valid
    end

    it 'author id must be integer' do
      @comment.author_id = 1.5
      expect(@comment).to_not be_valid
    end
  end
end
