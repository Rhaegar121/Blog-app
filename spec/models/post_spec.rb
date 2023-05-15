require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post Model' do
    before do
      @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher')
      @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post')
    end

    it 'title should not be blank' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'comment counter must be integer' do
      @post.comments_counter = 1.5
      expect(@post).to_not be_valid
    end

    it 'comment counter must be greater or equal to 0' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end

    it 'like counter must be integer' do
      @post.likes_counter = 1.5
      expect(@post).to_not be_valid
    end

    it 'like counter must be greater or equal to 0' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end
  end
end
