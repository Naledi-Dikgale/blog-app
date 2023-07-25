require 'rails_helper'
require 'capybara/rspec'

base_url = 'http://localhost:3000'

RSpec.describe 'User', type: :feature, js: false do
  users = User.all

  before(:each) do
    visit "#{base_url}/users"
  end

  describe 'content of user index page' do
    it 'shows the username' do
      users.each { |user| expect(page).to have_content user.name }
    end

    it 'should show users photo' do
      users.each { |user| expect(page).to have_css("img[src='#{user.photo}']") }
    end

    it 'should display user name' do
      users.each { |user| expect(page).to have_content(user.name) }
    end

    it 'should display the number of posts' do
      users.each { |user| expect(page).to have_content("Number of posts: #{user.posts.count}") }
    end

    it 'should display user bio' do
      users.each { |user| expect(page).to have_content(user.bio) }
    end

    it 'should redirect to the user details page' do
      users.each do |user|
        click_link user.name
        expect(page).to have_content(user.name)
      end
    end

    it 'should redirect to the show page when I click user post' do
      users.each do |user|
        click_link user.name
        click_link user.posts.first.title
        expect(page).to have_content(user.posts.first.title)
      end
    end
  end
end
