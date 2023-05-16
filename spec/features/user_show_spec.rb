require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before :each do
    @user = User.create(name: 'Ross', photo: 'https://picsum.photos/id/23/200', bio: 'Teacher from Mexico.', posts_counter: 0)
    @post1 = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @post2 = Post.create(author_id: @user.id, title: 'Hello World', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
    @post3 = Post.create(author_id: @user.id, title: 'Hi', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
    @post4 = Post.create(author_id: @user.id, title: 'Hi World', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)
    visit user_path @user.id
  end

  it 'can see the user profile picture' do
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/200']")
  end

  it 'can see the username' do
    expect(page).to have_content('Ross')
  end

  it 'can see the number of posts user has written' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'can see user bio' do
    expect(page).to have_content 'Teacher from Mexico.'
  end

  it 'can see the user first 3 posts' do
    expect(page).to have_content 'Hello'
    expect(page).to have_content 'Hello World'
    expect(page).to have_content 'Hi'
  end

  it 'can see a button that lets me view all of a user posts.' do
    expect(page).to have_link('See all posts')
  end

  it 'When I click a user post, it redirects me to that post show page.' do
    click_on 'Hello'
    expect(page).to have_content 'Hello'
  end

  it 'When I click to see all posts, it redirects me to the user post index page.' do
    click_on 'See all posts'
    expect(page).to have_content 'Ross'
  end
end
