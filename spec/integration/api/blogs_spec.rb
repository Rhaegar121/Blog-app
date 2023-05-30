require 'swagger_helper'

describe 'Posts API' do

  path '/api/v1/posts' do

    get 'Lists all posts for a user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :query, type: :integer, description: 'User ID'

      response '200', 'posts listed' do
        let(:user_id) { 3 }
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end
  end

  path '/api/v1/posts/{post_id}/comments' do

    get 'Lists all comments for a post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :post_id, in: :path, type: :integer, description: 'Post ID'

      response '200', 'comments listed' do
        let(:post_id) { 1 }
        run_test!
      end

      response '401', 'unauthorized' do
        run_test!
      end
    end

    post 'Adds a comment to a post' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :post_id, in: :path, type: :integer, description: 'Post ID'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: [ 'text' ]
      }

      response '201', 'comment created' do
        let(:post_id) { 1 }
        let(:comment) { { text: 'This is a new comment' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:post_id) { 1 }
        let(:comment) { { text: '' } }
        run_test!
      end

      response '401', 'unauthorized' do
        let(:post_id) { 1 }
        let(:comment) { { text: 'This is a new comment' } }
        run_test!
      end
    end
  end
end
