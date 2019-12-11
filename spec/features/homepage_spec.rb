require 'rails_helper'

RSpec.describe 'homepage' do
  it 'allows the admin to approve posts from the homepage' do
    post = create(:post)
    admin_user = create(:admin_user)
    login_as(admin_user, scope: :user)

    visit root_path
    click_on("approve_#{post.id}")
    expect(post.reload.status).to eq('approved')
  end

end