class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post'

  after_save :update_comments_counterLayout/EndOfLine: Carriage return character detected.

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
