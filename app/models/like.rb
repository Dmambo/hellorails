class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, counter_cache: true

  after_save :update_like_counter

  validates :post, presence: true

  private

  def update_like_counter
    post.update(likes_count: post.likes.count)
  end
end
