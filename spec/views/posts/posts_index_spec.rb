require 'rails_helper'

RSpec.describe 'User', type: :feature, js: false do
  before :each do
    @user = User.create(name: 'Naledi Dikgale', photo: 'https://e0.pxfuel.com/wallpapers/820/800/desktop-wallpaper-cute-black-girls-black-cartoon-characters-thumbnail.jpg',
                        bio: 'Undisputed Queen of DIY')
    @first_post = Post.create(author: @user, title: 'Naledi', text: 'How to make a table')
    @comment = Comment.create(post: @first_post, author: @user, text: 'Nice post!')

    visit "/users/#{@user.id}/posts"
  end

  describe 'Post page' do
    it "shows the user's profile" do
      expect(page).to have_css("img[src*='https://e0.pxfuel.com/wallpapers/820/800/desktop-wallpaper-cute-black-girls-black-cartoon-characters-thumbnail.jpg']")
    end

    it "shows the user's username" do
      expect(page).to have_content(@user.name)
    end

    it 'shows the number of post' do
      expect(page).to have_content(@user.posts.count)
    end

    it 'shows the title of the post' do
      expect(page).to have_content('Naledi')
    end

    it 'shows the body of the post' do
      expect(page).to have_content('How to make a table')
    end

    it 'shows the first comment of the post' do
      expect(page).to have_content(@comment.text)
    end

    it 'shows the number of posts' do
      expect(page).to have_content(@user.posts.count)
    end

    it 'shows the number of likes & comments' do
      user_post = @user.posts.find_by(id: @first_post.id)
      expect(page).to have_content(user_post.comments.count)
      expect(page).to have_content(user_post.likes.count)
    end

    it 'shows the username of all authors' do
      author_name = Comment.find_by(author: @user.name)
      expect(page).to have_content(author_name)
    end

    it 'shows the comment left by a author' do
      expect(page).to have_content(@comment.text)
    end

    it 'redirects to the post page when the post title is clicked' do
      click_link 'Naledi Dikgale'
      expect(page).to have_content('See all posts')
    end
  end
end
