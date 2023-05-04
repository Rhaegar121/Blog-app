class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments
  after_save :update_posts_counter

  validation :title, presence: true, length: { maximum: 250 }
  validation :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validation :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
