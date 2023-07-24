require 'rails_helper'

RSpec.describe 'User', type: :feature, js: false do
  before :each do
    @user = User.create(name: 'Naledi Dikgale', photo: 'https://e0.pxfuel.com/wallpapers/820/800/desktop-wallpaper-cute-black-girls-black-cartoon-characters-thumbnail.jpg',
                        bio: 'Undisputed Queen of DIY')
    @first_post = Post.create(author: @user, title: 'Naledi', text: 'How to make a table')
    @comment = Comment.create(post: @first_post, author: @user, text: 'Great post!')
  end

  it 'shows post title' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content('Naledi')
  end

  it 'shows post author' do
    user_name = Post.find_by(author: @user.name)
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(user_name)
  end

  it 'shows number of likes and comments' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    user_post = @user.posts.find_by(id: @first_post.id)
    expect(page).to have_content(user_post.comments.count)
    expect(page).to have_content(user_post.likes.count)
  end

  it 'shows the post text' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.text)
  end
  it 'shows the username of all authors' do
    author_name = Comment.find_by(author: @user.name)
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(author_name)
  end

  it 'shows the comment left by a author' do
    visit "/users/#{@user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@comment.text)
  end
end