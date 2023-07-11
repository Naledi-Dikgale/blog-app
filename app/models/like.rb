class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_like_count

  private

  def update_like_count
    post.increment!(:likes_counter)
  end
end
