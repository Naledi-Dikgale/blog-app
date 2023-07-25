require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'content of user index page' do
    let(:user) { User.create(name: 'Naledi', photo: 'photo', bio: 'text') }

    before(:each) do
      visit "/users/#{user.id}"
    end

    it 'shows the username' do
      expect(page).to have_content(user.name)
    end

    it 'should show users photo' do
      expect(page).to have_css("img[src='#{user.photo}']")
    end

    it 'should display user name' do
      expect(page).to have_content(user.name)
    end

    it 'should display the number of posts' do
      expect(page).to have_content("Number of posts: #{user.posts.count}")
    end

    it 'should display user bio' do
      expect(page).to have_content(user.bio)
    end

    it 'should display see all post link' do
      expect(page).to have_content('See all posts')
    end

    it 'See all posts should redirect to post index page' do
      see_all_posts_link = find('a', text: 'See all posts')
      see_all_posts_link.click
      expect(page).to have_current_path(user_posts_path(user))
    end
  end
end
