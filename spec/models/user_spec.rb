require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    it 'valid user' do
      test_user = FactoryBot.create(:user)

      expect(test_user).to be_valid
    end
  end
end
