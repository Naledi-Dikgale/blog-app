require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before(:each) do
    @user = User.create!(name: 'Naledi Dikgale')
    @post = @user.posts.create!(title: 'Test Post', text: 'This is a test post.')
  end

  context 'GET /index' do
    it 'should return http success' do
      get user_posts_path(@user)
      expect(response).to be_successful
    end

    it 'should render correct template' do
      get user_posts_path(@user)
      expect(response).to render_template('index')
    end
  end

  context 'GET /show' do
    it 'should return http success' do
      get user_post_path(@user, @post)
      expect(response).to be_successful
    end

    it 'should render correct template' do
      get user_post_path(@user, @post)
      expect(response).to render_template('show')
    end
  end
end
