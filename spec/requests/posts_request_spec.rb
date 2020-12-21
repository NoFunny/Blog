require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts/new' do
    it 'GET /posts/new' do
      get '/posts/new'
      expect(response).to have_http_status(:success)
    end

    it 'GET /posts/' do
      get '/posts'
      expect(response).to have_http_status(:success)
    end

    it 'GET /posts/867867' do
      get '/posts/867867'
      expect(response).to have_http_status(:not_found)
    end

    it 'GET /posts/1/edit' do
      get '/posts/1/edit'
      expect(response).to have_http_status(:not_found)
    end
  end
end
