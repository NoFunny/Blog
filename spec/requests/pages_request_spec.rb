require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /about' do
    it 'returns http success' do
      get '/about'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET home' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'returns http 404' do
      get '/asdfsdafsdafsdafsdafasdfsaxzczxvasdf'
      expect(response).to have_http_status(:not_found)
    end
  end
end
