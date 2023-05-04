require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'User Model' do
        before { @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

        it 'name should not be blank' do
            @user.name = nil
            expect(@user).to_not be_valid
        end

        it 'post counter must be greater or equal to 0' do
            @user.posts_counter = -1
            expect(@user).to_not be_valid
        end
    end
end