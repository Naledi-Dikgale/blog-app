require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      user = User.create(name: 'John')
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
    it 'renders the show template' do
      user = User.create(name: 'John')
      get :show, params: { id: user.id }
      expect(response).to render_template(:show)
    end
  end
end
