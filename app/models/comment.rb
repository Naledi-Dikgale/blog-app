class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :updte_comment_count

  private

  def updte_comment_count
    post.increment!(:comments_count)
  end
end
