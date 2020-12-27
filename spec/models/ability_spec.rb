require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe 'normal user' do
    it 'valid user' do
      test_user = FactoryBot.create(:user)

      ability = described_class.new(test_user)

      expect(ability.can?(:manage, :all)).to equal(false)
    end

    it 'admin user' do
      test_user = FactoryBot.create(:user)
      test_user.role = 'admin'

      ability = described_class.new(test_user)

      expect(ability.can?(:manage, :all)).to equal(true)
    end
  end
end
