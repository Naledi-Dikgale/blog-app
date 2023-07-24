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

    it 'should display the number of posts' do
      users.each { |user| expect(page).to have_content("Number of posts: #{user.posts.count}") }
    end
  end
end
