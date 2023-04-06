class Post < ApplicationRecord
  attr_accessor :author

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_post_counter
    author.update(posts_count: author.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end