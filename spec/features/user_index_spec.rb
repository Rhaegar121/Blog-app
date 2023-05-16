require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before :each do
    @user = User.create(name: 'Ross', photo: 'https://picsum.photos/id/23/200', bio: 'Teacher from Mexico.', posts_counter: 0)
    @post = Post.create(author_id: @user.id, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    @like = Like.create(post_id: @post.id, author_id: @user.id)
    visit root_path
  end

  it 'can see the username' do
    expect(page).to have_content('Ross')
  end

  it 'can see the profile picture' do
    expect(page).to have_css("img[src*='https://picsum.photos/id/23/200']")
  end

  it 'can see the number of posts each user has written' do
    expect(page).to have_content 'posts: 1'
  end

  it 'When I click on a user, I am redirected to that user show page' do
    click_on 'Ross'
    expect(page).to have_content 'Ross'
  end
end
