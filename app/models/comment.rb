class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  has_many :likes, dependent: :destroy

  after_save :updte_comment_count

  private

  def updte_comment_count
    post.increment!(:comments_counter)
  end
end
