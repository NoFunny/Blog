require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'add a comment' do
    it 'create bad comment' do
      test_comment = described_class.new(username: 'some user name', body: 'there is some body')
      expect(test_comment).not_to be_valid
    end
  end
end
