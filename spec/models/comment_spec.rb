require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it 'should be belongs to user' do
      expect(Comment.reflect_on_association(:author).macro).to eq(:belongs_to)
      expect(Comment.reflect_on_association(:post).macro).to eq(:belongs_to)
    end
  end

  # describe 'validations' do
  #   it 'should be valid with valid attributes' do
  #     first_post = Post.create(title: 'title', text: 'body', author_id: 1)
  #     comment = Comment.new(text: 'hey', author_id: 1, post_id: first_post.id)
  #     expect(comment).to be_valid
  #     comment.inspect
  #   end

  #   it 'should not be valid without text' do
  #     expect(Comment.new(text: nil, author_id: 1, post_id: 1)).to_not be_valid
  #   end

  #   it 'should not be valid without post_id' do
  #     expect(Comment.new(text: 'hey', author_id: 1, post_id: nil)).to_not be_valid
  #   end

  #   it 'should not be valid without author_id' do
  #     expect(Comment.new(text: 'hey', author_id: nil, post_id)).to_not be_valid
  #   end
  # end
end
