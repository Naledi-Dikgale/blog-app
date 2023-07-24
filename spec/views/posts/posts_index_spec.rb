RSpec.describe 'Posts', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Naledi Dikgale')
    @post1 = @user.posts.create!(title: 'Test Post 1', text: 'This is a test post 1.') 
    @post2 = @user.posts.create!(title: 'Test Post 2', text: 'This is a test post 2.') 
    # Create some comments for the posts
    @comment1 = @post1.comments.create!(user: @user, content: 'Comment 1 for post 1')
    @comment2 = @post1.comments.create!(user: @user, content: 'Comment 2 for post 1')
    @comment3 = @post2.comments.create!(user: @user, content: 'Comment 1 for post 2')
  end

  it 'displays user information' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.name)