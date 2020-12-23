require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  describe 'this one is dummy' do
    it 'returns http success' do
      get '/about'
      expect(response).to have_http_status(:success)
    end
  end
end
