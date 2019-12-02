require 'rails_helper'

RSpec.describe 'navigate' do
  let(:user) { create(:user) }
  let(:post) { create(:post, user_id: user.id) }

  describe 'edit' do

    it 'has a status that can be edited on the form by an admin' do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope: :user)
      visit edit_post_path(post)
      choose 'post_status_approved'
      click_on 'Save'
      expect(post.reload.status).to eq('approved')
    end

    it 'cannot be edited by a non admin' do
      login_as(user, scope: :user)
      visit edit_post_path(post)
      expect(page).to_not have_content('Approved')
    end
  end

end