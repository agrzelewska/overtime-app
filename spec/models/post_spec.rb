require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'creation' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    it 'can be created' do
      expect(post).to be_valid
    end

    it 'cannot be created without a date and rationale' do
      post.date = nil
      post.rationale = nil
      expect(post).to_not be_valid
    end

    it 'has an overtime_request greater then 0.0' do
      post.daily_hours = 0.0
      expect(post).to_not be_valid
    end
  end
end
