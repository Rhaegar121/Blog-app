require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment Model' do
    before do
      @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher')
      @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post')
      @like = Like.new(post_id: @post.id, author_id: @user.id)
    end

    it 'post id must be integer' do
      @like.post_id = 1.5
      expect(@like).to_not be_valid
    end

    it 'author id must be integer' do
      @like.author_id = 1.5
      expect(@like).to_not be_valid
    end
  end
end
