require 'rails_helper'

RSpec.describe 'posts', type: :feature do
  describe '#index' do
    before(:each) do
      @user = User.create(name: 'Naledi Dikgale', bio: 'Undisputed Queen of DIY', photo: 'photo')
      @post4 = Post.create(title: 'Hello', text: 'How to make a table', author_id: @user.id)
      @comment1 = Comment.create(text: 'How to be a con artist', author_id: @user.id, post_id: @post4.id)
      @comment2 = Comment.create(text: 'How to solve a crime', author_id: @user.id, post_id: @post4.id)
      @comment3 = Comment.create(text: 'Great post', author_id: @user.id, post_id: @post4.id)
      @comment4 = Comment.create(text: 'That is just awful', author_id: @user.id, post_id: @post4.id)
      @comment5 = Comment.create(text: 'Good post!', author_id: @user.id, post_id: @post4.id)
      @comment6 = Comment.create(text: 'Awesome stuff', author_id: @user.id, post_id: @post4.id)


      visit user_posts_path(@user)
    end
    it 'displays user information' do
      expect(page).to have_css('img')
      expect(page).to have_content('Naledi')
      expect(page).to have_content('Number of posts: 1')
    end
    it 'displays post information' do
      expect(page).to have_content('Hello')
      expect(page).to have_content('How to make a table')
      expect(page).to have_content('likes: 0')
      expect(page).to have_content('comments: 6')
    end
    it 'display latest comments on a post' do
      expect(page).not_to have_content('How to be a con artist')
    end
    it 'redirects to the post when clicked' do
      click_link('Hello')
      expect(current_path).to eq(user_post_path(@user, @post4))
    end
  end
end
