require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it 'should have correct associations' do
      expect(Post.reflect_on_association(:author).macro).to eq(:belongs_to)
      expect(Post.reflect_on_association(:comments).macro).to eq(:has_many)
      expect(Post.reflect_on_association(:likes).macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      post = Post.new(title: nil)
      expect(post).to_not be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'should validate numericality of comments_counter' do
      user = User.create(name: 'name')
      post = Post.new(title: 'title', text: 'text', author_id: user.id, comments_counter: -1)
      expect(post).to_not be_valid
      expect(post.errors[:comments_counter]).to include('must be greater than or equal to 0')
    end
    it 'should validate numericality of likes_counter' do
      user = User.create(name: 'name')
      post = Post.new(title: 'title', text: 'text', author_id: user.id, likes_counter: -1)
      expect(post).to_not be_valid
      expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end
  end

  describe '#five_most_recent_likes' do
    let(:user) { create(:user) }

    it 'returns the five most recent posts' do
      user = User.create(name: 'name')
      first_post = Post.create(title: 'first post', text: 'text', author_id: user.id)
      first_comment = Comment.create(text: 'text', author_id: user.id, post_id: first_post.id)
      Comment.create(text: 'text', author_id: user.id, post_id: first_post.id)
      Comment.create(text: 'text', author_id: user.id, post_id: first_post.id)
      Comment.create(text: 'text', author_id: user.id, post_id: first_post.id)
      Comment.create(text: 'text', author_id: user.id, post_id: first_post.id)
      Comment.create(text: 'text', author_id: user.id, post_id: first_post.id)
      expect(first_post.five_most_recent_comments).to_not include(first_comment)
    end
  end
end
