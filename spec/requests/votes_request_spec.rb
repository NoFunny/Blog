require 'rails_helper'

RSpec.describe 'Votes', type: :request do
  describe 'rating' do
    new_post = FactoryBot.create(:post)

    it 'inc rating' do
      post '/posts', params: { post: { title: new_post.title, body: new_post.body } }

      rand_post = Post.limit(5).order('RANDOM()')[0]
      rating_before = rand_post.rating

      post '/inc', params: { id: rand_post.id, user_id: 0 }

      expect(Post.find(rand_post.id).rating).to equal(rating_before + 1)
    end

    it 'dec rating' do
      post '/posts', params: { post: { title: new_post.title, body: new_post.body } }

      rand_post = Post.limit(5).order('RANDOM()')[0]
      rating_before = rand_post.rating

      post '/dec', params: { id: rand_post.id, user_id: 0 }

      expect(Post.find(rand_post.id).rating).to equal(rating_before - 1)
    end

    it 'inc rating twice' do
      post '/posts', params: { post: { title: new_post.title, body: new_post.body } }

      rand_post = Post.limit(5).order('RANDOM()')[0]
      rating_before = rand_post.rating

      post '/inc', params: { id: rand_post.id, user_id: 0 }
      post '/inc', params: { id: rand_post.id, user_id: 0 }

      expect(Post.find(rand_post.id).rating).to equal(rating_before + 1)
    end
  end
end
