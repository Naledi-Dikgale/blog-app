require 'rails_helper'

RSpec.describe UsersController, type: :request do
  context 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder' do
      get '/users'
      expect(response.body).to include('<h1>user index</h1>')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get '/users/show'
      expect(response).to render_template('show')
    end

    it 'should include correct placeholder' do
      get '/users/show'
      expect(response.body).to include('<h1>show user</h1>')
    end
  end
end
