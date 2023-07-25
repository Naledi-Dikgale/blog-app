require 'rails_helper'

RSpec.describe 'users', type: :feature do
  describe '#index' do
    before(:all) do
      @user1 = User.create(name: 'Naledi', photo: 'photo_url', bio: 'Undisputed Queen of DIY')
      @user2 = User.create(name: 'Judy', photo: 'photo_url_2', bio: 'Rabbit officer')
    end
    it 'shows all users' do
      visit users_path
      expect(page).to have_content('Naledi')
      expect(page).to have_content('Judy')
    end
    it 'display the photos for each user' do
      visit users_path
      expect(page).to have_css("img[src*='photo_url']")
      expect(page).to have_css("img[src*='photo_url_2']")
    end
    it 'Display number of post' do
      visit users_path
      expect(page).to have_content('Number of posts: 0')
    end
    it 'display number of posts for each user' do
      @post = Post.create(author_id: @user1.id, title: 'Naledi', text: 'How to make a table')
      visit users_path
      expect(page).to have_content('Number of posts: 1')
    end
    it 'Redirect to that user\'s show page on clicking a user' do
      @user3 = User.create(name: 'Nick', photo: 'photo_url_2', bio: 'Rabbit officer')
      visit users_path
      click_link(@user3.name)
      expect(current_path).to eq(user_path(@user3))
    end
  end
end
