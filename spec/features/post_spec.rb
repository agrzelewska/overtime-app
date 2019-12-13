require 'rails_helper'

RSpec.describe 'navigate', type: :feature do
  let(:user) { create(:user) }
  let!(:post1) { create(:post, user_id: user.id) }
  let!(:post2) { create(:second_post, user_id: user.id) }

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      expect(page).to have_content(/rationale|content/)
    end

    it 'has a scope so that only post creators can see their posts' do
      admin_user = FactoryBot.create(:admin_user)
      post_from_admin_user = Post.create(date: Date.today, rationale: 'Admin post', user_id: admin_user.id, overtime_request: 0.5)
      visit posts_path
      expect(page).to_not have_content(/Admin/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      employee = Employee.create(
          first_name: "Adam", last_name: "Winter", email: 'adam@test.com',
          password: "asdfasdf", password_confirmation: "asdfasdf", phone: "123456789")
      login_as(employee, :scope => :user)
      visit root_path
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      visit posts_path
      click_link("delete_#{post1.id}")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"
      fill_in 'post[overtime_request]', with: 0.5
      expect { click_on "Save" }.to change(Post, :count).by(1)
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User_Association"
      fill_in 'post[overtime_request]', with: 0.5
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User_Association")
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_post_path(post1)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Edited content"
      click_on 'Save'
      expect(page).to have_content("Edited content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryBot.create(:user)
      login_as(non_authorized_user, scope: :user)
      visit edit_post_path(post1)
      expect(current_path).to eq(root_path)
    end
  end
end