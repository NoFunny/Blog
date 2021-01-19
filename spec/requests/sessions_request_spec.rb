require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/sessions/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'login' do
    subject(:login) { post '/login', params: { session: { email: 'qwerty@mail.ru', password: '123456789' } } }

    it 'succesfull login' do
      post '/users',
           params: { user: { name: 'someValidName', email: 'qwerty@mail.ru', password: '123456789',
                             password_confirmation: '123456789' } }

      redirect_path = "/users/#{User.where(email: 'qwerty@mail.ru')[0].id}"

      expect(:login).to redirect_to(redirect_path)
    end

    it 'unable to login login' do
      post '/users',
           params: { user: { name: 'someValidName', email: 'qwerty@mail.ru', password: '123456789',
                             password_confirmation: '123456789' } }

      post '/login', params: { session: { email: 'qwerty@mail.ru', password: '654456' } }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
