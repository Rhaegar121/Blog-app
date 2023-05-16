require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before :each do
    @user = User.create(name: 'Ross', photo: 'https://picsum.photos/id/23/200', bio: 'Teacher from Mexico.', posts_counter: 0)
    @post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @comment1 = Comment.create(post_id: @post.id, author_id: @user.id, text: 'This is my first comment')
    @comment2 = Comment.create(post_id: @post.id, author_id: @user.id, text: 'This is my second comment')
    visit user_post_path(user_id: @post.author_id, id: @post.id)
  end

  it 'can see post title' do
    expect(page).to have_content 'Hello'
  end

  it 'can see who wrote the post' do
    expect(page).to have_content 'Ross'
  end

  it 'can see how many comments it has' do
    expect(page).to have_content(@post.comments_counter)
  end

  it 'can see how many likes it has' do
    expect(page).to have_content(@post.likes_counter)
  end

  it 'can see post body' do
    expect(page).to have_content 'This is my first post'
  end

  it 'can see username of each commenter' do
        expect(page).to have_content(@comment1.author.name)
        expect(page).to have_content(@comment2.author.name)
    end
  
    it 'can see comments each commenter left' do
        expect(page).to have_content 'This is my first comment'
        expect(page).to have_content 'This is my second comment'
    end
end
