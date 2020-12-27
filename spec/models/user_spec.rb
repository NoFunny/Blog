require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    it 'valid user' do
      test_user = FactoryBot.create(:user)

      expect(test_user).to be_valid
    end

    it 'invalid user name' do
      expect do
        test_user = FactoryBot.create(:user, name: '123456789101112131415161718192021222324252627282930', )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'invalid user mail' do
      expect do
        test_user = FactoryBot.create(:user, email: 'dfgbhjdf', )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'invalid user password' do
      expect do
        test_user = FactoryBot.create(:user, password: '1', )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'check for admin' do
      test_user = FactoryBot.create(:user)

      expect(test_user.admin?).to equal(false)
    end
  end

  describe 'remember' do
    it 'valid user' do
      test_user = FactoryBot.create(:user)

      test_user.remember

      expect(test_user.authenticated?(test_user.remember_token)).to equal(true)
    end

    it 'forget user' do
      test_user = FactoryBot.create(:user)

      test_user.remember

      test_user.forget

      expect(test_user.authenticated?(test_user.remember_token)).to equal(false)
    end
  end
end
