require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'should have correct associations' do
      expect(User.reflect_on_association(:comments).macro).to eq(:has_many)
      expect(User.reflect_on_association(:posts).macro).to eq(:has_many)
      expect(User.reflect_on_association(:likes).macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it 'should validate presence of name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'should validate numericality of posts_counter' do
      user = User.new(name: 'name', posts_counter: -1)
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end
  end

  describe '#three_most_recent_posts' do
    let(:user) { create(:user) }

    it 'returns the three most recent posts' do
      user = User.create(name: 'name')
      first_post = Post.create(title: 'first post', text: 'text', author_id: user.id)
      Post.create(title: 'second post', text: 'text', author_id: user.id)
      Post.create(title: 'third post', text: 'text', author_id: user.id)
      Post.create(title: 'fourth post', text: 'text', author_id: user.id)
      expect(user.three_most_recent_posts).to_not include(first_post)
    end
  end
end
