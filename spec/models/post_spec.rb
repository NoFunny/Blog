require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'add a post' do
    it 'create valid post' do
      test_post = described_class.new(title: 'Test post', body: 'there is some body')
      expect(test_post).to be_valid
    end

    it 'create bad post' do
      test_post = described_class.new(title: 'T', body: '')
      expect(test_post).not_to be_valid
    end
  end
end
