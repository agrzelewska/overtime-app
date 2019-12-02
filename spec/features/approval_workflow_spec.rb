require 'rails_helper'

RSpec.describe 'navigate' do
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }
  let(:admin_user) { create(:admin_user) }

  before { login_as(admin_user, scope: :user) }

  describe 'edit' do

    it 'has a status that can be edited on the form by an admin' do
      visit edit_post_path(post)
      choose 'post_status_approved'
      click_on 'Save'
      expect(post.reload.status).to eq('approved')
    end

    it 'cannot be edited by a non admin' do
      logout(user)
      login_as(user, scope: :user)
      visit edit_post_path(post)
      expect(page).to_not have_content('Approved')
    end

    it 'should not be editable by the post creator if status is approved' do
      logout(:user)
      login_as(user, scope: :user)
      post.update(status: 'approved')
      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end
  end

end