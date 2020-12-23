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

  describe 'create new post' do
    new_post = FactoryBot.create(:post)

    it 'create new post' do
      expect do
        post '/posts',
             params: { post: { title: new_post.title, body: new_post.body } }
      end.to change(Post, :count).by(1)
    end
  end

  describe 'edit new post' do
    new_post = FactoryBot.create(:post)

    it 'edit rand post' do
      post '/posts', params: { post: { title: new_post.title, body: new_post.body } }

      get "/posts/#{Post.limit(5).order('RANDOM()')[0].id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'delete post' do
    new_post = FactoryBot.create(:post)

    it 'delete rand post' do
      post '/posts', params: { post: { title: new_post.title, body: new_post.body } }
      count_before = Post.count
      delete '/posts/' + Post.limit(5).order('RANDOM()')[0].id.to_s
      expect(Post.count).to equal(count_before - 1)
    end
  end
end
