class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments
  after_save :update_posts_counter

  validates :title, presence: true, length: { maximum: 250 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)Layout/EndOfLine: Carriage return character detected.
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
