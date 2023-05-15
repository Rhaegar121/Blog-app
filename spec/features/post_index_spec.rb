require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
  before :each do
    @user = User.create(name: 'Ross', photo: 'https://picsum.photos/id/23/200', bio: 'Teacher from Mexico.', posts_counter: 0)
    @post1 = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(author_id: @user.id, title: 'World', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(author_id: @user.id, title: 'Hi', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
    @post4 = Post.create(author_id: @user.id, title: 'Hi World', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)
    @comment = Comment.create(post_id: @post1.id, author_id: @user.id, text: 'This is my first comment')
    @like = Like.create(post_id: @post1.id, author_id: @user.id)
    visit user_posts_path @user.id
  end

  it 'can see user profile picture' do
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/200']")
  end

  it 'can see the username' do
    expect(page).to have_content('Ross')
  end

  it 'can see the number of posts user has written' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'can see post title' do
    expect(page).to have_content 'Hello'
  end

  it 'can see some of the post body' do
    expect(page).to have_content 'This is my first post'
  end

  it 'can see first comment on post' do
    expect(page).to have_content 'This is my first comment'
  end

  it 'can see how many comments post has' do
    expect(page).to have_content 'Comments: 1'
  end

  it 'can see how many likes post has' do
    expect(page).to have_content 'Likes: 1'
  end

  it 'When I click on a post, it redirects me to that post show page' do
    click_on 'Hello'
    expect(page).to have_content 'Hello'
  end
end
