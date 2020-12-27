require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/new' do
    it 'GET /users/25' do
      get '/users/25'
      expect(response).to have_http_status(:not_found)
    end

    it 'GET /users/new' do
      get '/users/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'create' do
    it 'GET /users/25' do
      expect do
        post '/users', params: { user: { name: 'someValidName', email: 'qwerty@mail.ru', password: '123456789', password_confirmation: '123456789'} }
      end.to change(User, :count).by(1)
    end
  end
end
